package org.example.database_system.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import okhttp3.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Service
public class MusicApiService {
    
    @Autowired
    private OkHttpClient okHttpClient;
    
    private static final String SEARCH_URL = "https://u.y.qq.com/cgi-bin/musicu.fcg";
    
    public Map<String, Object> searchSong(String title, String artistName) {
        try {
            // 构建搜索请求
            String postData = String.format(
                "{\"comm\":{\"_channelid\":\"19\",\"_os_version\":\"6.2.9200-2\",\"authst\":\"Q_H_L_5tvGesDV1E9ywCVIuapBeYL7IYKKtbZErLj5HeBkyXeqXtjfQYhP5tg\",\"ct\":\"19\",\"cv\":\"1873\",\"guid\":\"B69D8BC956E47C2B65440380380B7E9A\",\"patch\":\"118\",\"psrf_access_token_expiresAt\":1697829214,\"psrf_qqaccess_token\":\"A865B8CA3016A74B1616F8919F667B0B\",\"psrf_qqopenid\":\"2AEA845D18EF4BCE287B8EFEDEA1EBCA\",\"psrf_qqunionid\":\"6EFC814008FAA695ADD95392D7D5ADD2\",\"tmeAppID\":\"qqmusic\",\"tmeLoginType\":2,\"uin\":\"961532186\",\"wid\":\"0\"},\"music.search.SearchCgiService\":{\"method\":\"DoSearchForQQMusicDesktop\",\"module\":\"music.search.SearchCgiService\",\"param\":{\"grp\":1,\"num_per_page\":1,\"page_num\":1,\"query\":\"%s %s\",\"remoteplace\":\"txt.newclient.history\",\"search_type\":0,\"searchid\":\"6254988708H54D2F969E5D1C81472A98609002\"}}}",
                title, artistName
            );
            
            RequestBody formBody = RequestBody.create(
                MediaType.parse("application/json; charset=UTF-8"), 
                postData
            );
            
            Request request = new Request.Builder()
                    .url(SEARCH_URL)
                    .post(formBody)
                    .addHeader("User-Agent", "Mozilla/5.0 (Linux; Android 6.0.1; OPPO R9s Plus Build/MMB29M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/55.0.2883.91 Mobile Safari/537.36")
                    .addHeader("Host", "u.y.qq.com")
                    .build();
            
            // 发送请求
            Response response = okHttpClient.newCall(request).execute();
            if (!response.isSuccessful()) {
                throw new IOException("搜索请求失败");
            }
            
            // 解析响应
            JSONObject jsonResponse = JSON.parseObject(response.body().string());
            JSONObject result = jsonResponse.getJSONObject("music.search.SearchCgiService")
                    .getJSONObject("data")
                    .getJSONObject("body")
                    .getJSONObject("song")
                    .getJSONArray("list")
                    .getJSONObject(0);
            
            if (result == null) {
                return null;
            }
            
            Map<String, Object> songInfo = new HashMap<>();
            songInfo.put("title", result.getString("name"));
            songInfo.put("duration", result.getInteger("interval")); // QQ音乐返回的是秒数
            songInfo.put("artistName", result.getJSONArray("singer").getJSONObject(0).getString("name"));
            songInfo.put("artistCountry", "未知"); // QQ音乐API没有提供国籍信息
            songInfo.put("albumTitle", result.getJSONObject("album").getString("name"));
            songInfo.put("releaseDate", result.getString("time_public")); // 发行日期
            
            return songInfo;
            
        } catch (Exception e) {
            throw new RuntimeException("搜索歌曲失败: " + e.getMessage());
        }
    }
} 