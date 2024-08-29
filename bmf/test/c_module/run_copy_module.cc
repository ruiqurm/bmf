#include <cstdio>
#include <string.h>
#include "builder.hpp"
#include <iostream>
#include "nlohmann/json.hpp"

int main(){
    nlohmann::json decode_para = {
        {"input_path", "big_bunny_10s_30fps.mp4"}};
    bmf::builder::Graph graph = bmf::builder::Graph(bmf::builder::NormalMode);

    // create decoder
    nlohmann::json decoder_option = {{"input_path", "../../files/overlay.png"}};
    auto decoder =
        graph.Sync(std::vector<int>{}, std::vector<int>{0},
                   bmf_sdk::JsonParam(decoder_option), "c_ffmpeg_decoder");
    graph.Sync(std::vector<int>{}, std::vector<int>{0},
            bmf_sdk::JsonParam(decoder_option), "c_ffmpeg_decoder");
}