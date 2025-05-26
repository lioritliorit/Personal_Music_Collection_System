// 当前用户ID
let currentUserId = 1;

// 页面加载完成后初始化
document.addEventListener('DOMContentLoaded', () => {
    // 绑定标签页按钮事件
    document.getElementById('all-songs-btn').addEventListener('click', showAllSongs);
    document.getElementById('my-favorites-btn').addEventListener('click', () => showFavorites(currentUserId));

    // 绑定搜索表单事件
    document.getElementById('search-form').addEventListener('submit', (e) => {
        e.preventDefault();
        const keyword = document.getElementById('search-input').value.trim();
        if (keyword) {
            searchSongs(keyword);
        }
    });

    // 绑定管理功能事件
    document.querySelector('.user-actions button').addEventListener('click', deleteUser);
    document.querySelector('.artist-actions button').addEventListener('click', updateArtistPlayCount);

    // 默认显示所有歌曲
    showAllSongs();
});

// 显示所有歌曲
async function showAllSongs() {
    try {
        updateActiveTab('all-songs-btn');
        const response = await fetch('/api/songs');
        if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
        const songs = await response.json();
        await renderSongs(songs);
    } catch (error) {
        showError('加载歌曲失败: ' + error.message);
    }
}

// 显示收藏夹
async function showFavorites(userId) {
    try {
        updateActiveTab('my-favorites-btn');
        const response = await fetch(`/api/favorites/${userId}`);
        if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
        const songs = await response.json();
        await renderSongs(songs);
    } catch (error) {
        showError('加载收藏失败: ' + error.message);
    }
}

// 搜索歌曲
async function searchSongs(keyword) {
    try {
        const response = await fetch(`/api/songs/search?keyword=${encodeURIComponent(keyword)}`);
        if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
        const songs = await response.json();
        await renderSongs(songs);
    } catch (error) {
        showError('搜索失败: ' + error.message);
    }
}

// 删除用户（事务操作）
async function deleteUser() {
    const userId = document.getElementById('user-id').value;
    if (!userId) {
        alert('请输入要删除的用户ID');
        return;
    }

    if (!confirm(`确定要删除用户${userId}及其所有收藏记录吗？此操作不可恢复！`)) {
        return;
    }

    try {
        const response = await fetch(`/api/users/${userId}`, {
            method: 'DELETE'
        });
        if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
        alert('用户删除成功！');
        document.getElementById('user-id').value = '';
    } catch (error) {
        alert('删除失败: ' + error.message);
    }
}

// 更新艺术家歌曲播放次数（存储过程）
async function updateArtistPlayCount() {
    const artistId = document.getElementById('artist-id').value;
    const increment = document.getElementById('play-count').value;

    if (!artistId || !increment) {
        alert('请输入艺术家ID和播放次数增量');
        return;
    }

    try {
        const response = await fetch(`/api/artists/${artistId}/play-count?increment=${increment}`, {
            method: 'POST'
        });
        if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
        alert('播放次数更新成功！');
        showAllSongs(); // 刷新显示
    } catch (error) {
        alert('更新失败: ' + error.message);
    }
}

// 切换收藏状态
async function toggleFavorite(songId) {
    try {
        const response = await fetch(`/api/favorites/${currentUserId}/${songId}`, {
            method: 'POST'
        });
        if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);

        // 刷新当前视图
        if (document.getElementById('my-favorites-btn').classList.contains('active')) {
            await showFavorites(currentUserId);
        } else {
            await showAllSongs();
        }
    } catch (error) {
        showError('收藏操作失败: ' + error.message);
    }
}

// 更新活动标签状态
function updateActiveTab(activeId) {
    document.querySelectorAll('.tabs button').forEach(btn => {
        btn.classList.remove('active');
    });
    document.getElementById(activeId).classList.add('active');
}

// 显示错误信息
function showError(message) {
    document.getElementById('song-list').innerHTML = `<div class="error">${message}</div>`;
}

// 渲染歌曲列表
async function renderSongs(songs) {
    const list = document.getElementById('song-list');
    if (!Array.isArray(songs)) {
        showError('数据格式错误');
        return;
    }

    // 获取收藏状态
    const favStatus = await Promise.all(
        songs.map(song => fetch(`/api/favorites/check/${currentUserId}/${song.id}`).then(r => r.json()))
    );

    list.innerHTML = songs.map((song, idx) => `
        <div class="song-item">
            <div class="song-info">
                <h3>${song.title || '未知歌曲'}</h3>
                <p>
                    专辑: ${song.album?.title || '未知专辑'} |
                    艺术家: ${song.album?.artist?.name || '未知艺术家'} |
                    时长: ${formatDuration(song.duration)} |
                    播放次数: ${song.playCount || 0}
                </p>
            </div>
            <div class="song-actions">
                <button onclick="toggleFavorite(${song.id})"
                        class="fav-btn ${favStatus[idx] ? 'active' : ''}">
                    ❤
                </button>
            </div>
        </div>
    `).join('');
}

// 格式化时长
function formatDuration(seconds) {
    if (!seconds) return '--:--';
    const minutes = Math.floor(seconds / 60);
    const remainingSeconds = seconds % 60;
    return `${minutes}:${remainingSeconds.toString().padStart(2, '0')}`;
}


