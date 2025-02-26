# frozen_string_literal: true

require "test_helper"

module Sources
  class XiaohongshuTest < ActiveSupport::TestCase
    context "Xiaohongshu:" do
      context "A xhscdn.com sample image URL" do
        strategy_should_work(
          "http://sns-webpic-qc.xhscdn.com/202405050857/60985d4963cfb500a9b0838667eb3adc/1000g00828idf6nofk05g5ohki5uk137o8beqcv8!nd_dft_wgth_webp_3",
          image_urls: %w[https://ci.xiaohongshu.com/1000g00828idf6nofk05g5ohki5uk137o8beqcv8],
          media_files: [{ file_size: 561_862 }],
          page_url: nil,
        )
      end

      context "A ci.xiaohongshu.com full image URL" do
        strategy_should_work(
          "https://ci.xiaohongshu.com/1000g00828idf6nofk05g5ohki5uk137o8beqcv8",
          image_urls: %w[https://ci.xiaohongshu.com/1000g00828idf6nofk05g5ohki5uk137o8beqcv8],
          media_files: [{ file_size: 561_862 }],
          page_url: nil,
        )
      end

      context "A img.xiaohongshu.com avatar sample image URL" do
        strategy_should_work(
          "https://img.xiaohongshu.com/avatar/5b56be0014de415b2db830a6.jpg@160w_160h_92q_1e_1c_1x.jpg",
          image_urls: %w[https://img.xiaohongshu.com/avatar/5b56be0014de415b2db830a6.jpg],
          media_files: [{ file_size: 571_625 }],
          page_url: nil,
        )
      end

      context "A post with multiple images" do
        strategy_should_work(
          "https://www.xiaohongshu.com/explore/674a802f0000000007029471?xsec_token=ABgt_jFg7t-LqYcRm3UlqACnVpHeS-InXHcQ2BeoLJKfU=&xsec_source=pc_user",
          image_urls: %w[
            https://ci.xiaohongshu.com/1040g2sg31aqeccv4mo704a54lgjgfvujhe954v8
            https://ci.xiaohongshu.com/1040g2sg31aqeccv4mo7g4a54lgjgfvujfhua5oo
            https://ci.xiaohongshu.com/1040g2sg31aqeccv4mo804a54lgjgfvuj16g2iho
          ],
          media_files: [
            { file_size: 1_427_202 },
            { file_size: 699_830 },
            { file_size: 844_990 }
          ],
          page_url: "https://www.xiaohongshu.com/explore/674a802f0000000007029471?xsec_token=ABgt_jFg7t-LqYcRm3UlqACnVpHeS-InXHcQ2BeoLJKfU=",
          profile_urls: %w[https://www.xiaohongshu.com/user/profile/5af06707db2e600283b2ffd3],
          display_name: "撸卜🥕",
          username: nil,
          tags: [
            ["绘画", "https://www.xiaohongshu.com/search_result/?keyword=绘画"],
            ["明日方舟", "https://www.xiaohongshu.com/search_result/?keyword=明日方舟"],
            ["铃兰", "https://www.xiaohongshu.com/search_result/?keyword=铃兰"],
            ["忍冬", "https://www.xiaohongshu.com/search_result/?keyword=忍冬"],
          ],
          dtext_artist_commentary_title: "妈妈的伞☂️",
          dtext_artist_commentary_desc: "\"#绘画\":[https://www.xiaohongshu.com/search_result?keyword=%25E7%25BB%2598%25E7%2594%25BB&type=54&source=web_note_detail_r10] \"#明日方舟\":[https://www.xiaohongshu.com/search_result?keyword=%25E6%2598%258E%25E6%2597%25A5%25E6%2596%25B9%25E8%2588%259F&type=54&source=web_note_detail_r10] \"#铃兰\":[https://www.xiaohongshu.com/search_result?keyword=%25E9%2593%2583%25E5%2585%25B0&type=54&source=web_note_detail_r10] \"#忍冬\":[https://www.xiaohongshu.com/search_result?keyword=%25E5%25BF%258D%25E5%2586%25AC&type=54&source=web_note_detail_r10]"
        )
      end

      context "A post with user id in url" do
        strategy_should_work(
          "https://www.xiaohongshu.com/user/profile/5af06707db2e600283b2ffd3/674a802f0000000007029471?xsec_token=ABgt_jFg7t-LqYcRm3UlqACnVpHeS-InXHcQ2BeoLJKfU=&xsec_source=pc_user",
          image_urls: %w[
            https://ci.xiaohongshu.com/1040g2sg31aqeccv4mo704a54lgjgfvujhe954v8
            https://ci.xiaohongshu.com/1040g2sg31aqeccv4mo7g4a54lgjgfvujfhua5oo
            https://ci.xiaohongshu.com/1040g2sg31aqeccv4mo804a54lgjgfvuj16g2iho
          ],
          media_files: [
            { file_size: 1_427_202 },
            { file_size: 699_830 },
            { file_size: 844_990 }
          ],
          page_url: "https://www.xiaohongshu.com/user/profile/5af06707db2e600283b2ffd3/674a802f0000000007029471?xsec_token=ABgt_jFg7t-LqYcRm3UlqACnVpHeS-InXHcQ2BeoLJKfU=",
          profile_urls: %w[https://www.xiaohongshu.com/user/profile/5af06707db2e600283b2ffd3],
          display_name: "撸卜🥕",
          username: nil,
          tags: [
            ["绘画", "https://www.xiaohongshu.com/search_result/?keyword=绘画"],
            ["明日方舟", "https://www.xiaohongshu.com/search_result/?keyword=明日方舟"],
            ["铃兰", "https://www.xiaohongshu.com/search_result/?keyword=铃兰"],
            ["忍冬", "https://www.xiaohongshu.com/search_result/?keyword=忍冬"],
          ],
          dtext_artist_commentary_title: "妈妈的伞☂️",
          dtext_artist_commentary_desc: "\"#绘画\":[https://www.xiaohongshu.com/search_result?keyword=%25E7%25BB%2598%25E7%2594%25BB&type=54&source=web_note_detail_r10] \"#明日方舟\":[https://www.xiaohongshu.com/search_result?keyword=%25E6%2598%258E%25E6%2597%25A5%25E6%2596%25B9%25E8%2588%259F&type=54&source=web_note_detail_r10] \"#铃兰\":[https://www.xiaohongshu.com/search_result?keyword=%25E9%2593%2583%25E5%2585%25B0&type=54&source=web_note_detail_r10] \"#忍冬\":[https://www.xiaohongshu.com/search_result?keyword=%25E5%25BF%258D%25E5%2586%25AC&type=54&source=web_note_detail_r10]"
        )
      end

      context "A post with /spectrum/ image URLs" do
        strategy_should_work(
          "https://www.xiaohongshu.com/explore/676692a9000000000b022e4d?xsec_token=ABp9YCBRRqv5v30dlFfxzHw8HBaoViPhFHlY2eTE035AM=",
          image_urls: %w[
            https://ci.xiaohongshu.com/spectrum/1040g0k031blr5gcag8005o752t9g90v028pbu80
            https://ci.xiaohongshu.com/spectrum/1040g0k031blr5mbl0c005o752t9g90v0ah6ctv0
            https://ci.xiaohongshu.com/spectrum/1040g0k031blr5mbl0c0g5o752t9g90v0r22nlj0
            https://ci.xiaohongshu.com/spectrum/1040g0k031blr5mbl0c105o752t9g90v0lp9ibqg
            https://ci.xiaohongshu.com/spectrum/1040g0k031blr5mbl0c1g5o752t9g90v0uc58cj0
            https://ci.xiaohongshu.com/spectrum/1040g0k031blr5mbl0c205o752t9g90v02hsbnk8
            https://ci.xiaohongshu.com/spectrum/1040g0k031blr5mbl0c2g5o752t9g90v0ff1s0s0
            https://ci.xiaohongshu.com/spectrum/1040g0k031blr5mbl0c305o752t9g90v0ke7vp40
            https://ci.xiaohongshu.com/spectrum/1040g0k031blr5mbl0c3g5o752t9g90v00g8uka8
            https://ci.xiaohongshu.com/spectrum/1040g0k031blr5mbl0c405o752t9g90v03m2llno
          ],
          media_files: [
            { file_size: 2_432_700 },
            { file_size: 1_543_097 },
            { file_size: 1_475_318 },
            { file_size: 1_552_256 },
            { file_size: 1_485_541 },
            { file_size: 1_512_886 },
            { file_size: 1_348_828 },
            { file_size: 1_531_060 },
            { file_size: 1_523_305 },
            { file_size: 1_613_587 }
          ],
          page_url: "https://www.xiaohongshu.com/user/profile/60e5175300000000010083e0/676692a9000000000b022e4d?xsec_token=ABp9YCBRRqv5v30dlFfxzHw8HBaoViPhFHlY2eTE035AM=",
          profile_urls: %w[https://www.xiaohongshu.com/user/profile/60e5175300000000010083e0],
          display_name: "面包棍棍",
          username: nil,
          tags: [
            ["明日方舟", "https://www.xiaohongshu.com/search_result/?keyword=明日方舟"],
            ["搬空罗德岛食堂", "https://www.xiaohongshu.com/search_result/?keyword=搬空罗德岛食堂"],
            ["comike105", "https://www.xiaohongshu.com/search_result/?keyword=comike105"],
            ["cpgz07", "https://www.xiaohongshu.com/search_result/?keyword=cpgz07"],
          ],
          dtext_artist_commentary_title: "搬空食堂DLC全收录🍽",
          dtext_artist_commentary_desc: <<~EOS.chomp
            做完了两年的企划怎么不算是2023-2024小结呢……挺能画啊我自己！（叉会腰）

            整理了本DLC插图全收录的48P小图册，会参加年底的冬コミ（C105），如果有去CM的朋友欢迎来東7/U39b找我玩——！
            国内的话，因为还有食品补充和收纳盒的部分待制作所以会稍晚一点，预计首发会是明年二月广州CPG07，已火速申摊香菇莫辜负🙏
            "#明日方舟":[https://www.xiaohongshu.com/search_result?keyword=%25E6%2598%258E%25E6%2597%25A5%25E6%2596%25B9%25E8%2588%259F&type=54&source=web_note_detail_r10] "#搬空罗德岛食堂":[https://www.xiaohongshu.com/search_result?keyword=%25E6%2590%25AC%25E7%25A9%25BA%25E7%25BD%2597%25E5%25BE%25B7%25E5%25B2%259B%25E9%25A3%259F%25E5%25A0%2582&type=54&source=web_note_detail_r10] "#comike105":[https://www.xiaohongshu.com/search_result?keyword=comike105&type=54&source=web_note_detail_r10] "#cpgz07":[https://www.xiaohongshu.com/search_result?keyword=cpgz07&type=54&source=web_note_detail_r10]
          EOS
        )
      end

      context "A video post" do
        strategy_should_work(
          "https://www.xiaohongshu.com/explore/6789d20f000000001d011d4b?xsec_token=ABYRoRr3DGE29GWtiam4UBANcw79-RNRRc1VdpIJVdz1A=",
          image_urls: %w[https://sns-video-bd.xhscdn.com/spectrum/1040g0jg31co8l51912005nrar8808fbnkchvk1o],
          media_files: [{ file_size: 21_449_849 }],
          page_url: "https://www.xiaohongshu.com/user/profile/5f6ada100000000001003d77/6789d20f000000001d011d4b?xsec_token=ABYRoRr3DGE29GWtiam4UBANcw79-RNRRc1VdpIJVdz1A=",
          profile_urls: %w[https://www.xiaohongshu.com/user/profile/5f6ada100000000001003d77],
          display_name: "✨Rocky",
          username: nil,
          tags: [
            ["锈湖", "https://www.xiaohongshu.com/search_result/?keyword=锈湖"],
            ["锈湖系列", "https://www.xiaohongshu.com/search_result/?keyword=锈湖系列"],
            ["锈湖天堂岛", "https://www.xiaohongshu.com/search_result/?keyword=锈湖天堂岛"],
            ["锈湖旅馆", "https://www.xiaohongshu.com/search_result/?keyword=锈湖旅馆"],
            ["同人", "https://www.xiaohongshu.com/search_result/?keyword=同人"],
            ["锈湖同人", "https://www.xiaohongshu.com/search_result/?keyword=锈湖同人"],
            ["rustylake", "https://www.xiaohongshu.com/search_result/?keyword=rustylake"],
            ["fanart", "https://www.xiaohongshu.com/search_result/?keyword=fanart"],
            ["插画", "https://www.xiaohongshu.com/search_result/?keyword=插画"],
            ["二创", "https://www.xiaohongshu.com/search_result/?keyword=二创"],
          ],
          dtext_artist_commentary_title: "◾️没有伟大的牺牲，就没有锈湖。",
          dtext_artist_commentary_desc: <<~EOS.chomp
            血色将至🩸There will be blood.
            🥲本来想做隐藏图的但是后面尝试发现只能做饱和度非常低的版本，效果很差，所以放弃啦~
            "#锈湖":[https://www.xiaohongshu.com/search_result?keyword=%25E9%2594%2588%25E6%25B9%2596&type=54&source=web_note_detail_r10] "#锈湖系列":[https://www.xiaohongshu.com/search_result?keyword=%25E9%2594%2588%25E6%25B9%2596%25E7%25B3%25BB%25E5%2588%2597&type=54&source=web_note_detail_r10] "#锈湖天堂岛":[https://www.xiaohongshu.com/search_result?keyword=%25E9%2594%2588%25E6%25B9%2596%25E5%25A4%25A9%25E5%25A0%2582%25E5%25B2%259B&type=54&source=web_note_detail_r10] "#锈湖旅馆":[https://www.xiaohongshu.com/search_result?keyword=%25E9%2594%2588%25E6%25B9%2596%25E6%2597%2585%25E9%25A6%2586&type=54&source=web_note_detail_r10] "#同人":[https://www.xiaohongshu.com/search_result?keyword=%25E5%2590%258C%25E4%25BA%25BA&type=54&source=web_note_detail_r10] "#锈湖同人":[https://www.xiaohongshu.com/search_result?keyword=%25E9%2594%2588%25E6%25B9%2596%25E5%2590%258C%25E4%25BA%25BA&type=54&source=web_note_detail_r10] "#rustylake":[https://www.xiaohongshu.com/search_result?keyword=rustylake&type=54&source=web_note_detail_r10] "#fanart":[https://www.xiaohongshu.com/search_result?keyword=fanart&type=54&source=web_note_detail_r10] "#插画":[https://www.xiaohongshu.com/search_result?keyword=%25E6%258F%2592%25E7%2594%25BB&type=54&source=web_note_detail_r10] "#二创":[https://www.xiaohongshu.com/search_result?keyword=%25E4%25BA%258C%25E5%2588%259B&type=54&source=web_note_detail_r10]
          EOS
        )
      end

      context "A deleted or nonexistent post" do
        strategy_should_work(
          "https://www.xiaohongshu.com/explore/999999999",
          image_urls: %w[],
          media_files: [],
          page_url: "https://www.xiaohongshu.com/explore/999999999",
          profile_url: nil,
          profile_urls: %w[],
          display_name: nil,
          other_names: [],
          tags: [],
          dtext_artist_commentary_title: "",
          dtext_artist_commentary_desc: ""
        )
      end

      should "Parse URLs correctly" do
        assert(Source::URL.image_url?("http://sns-webpic-qc.xhscdn.com/202405050857/60985d4963cfb500a9b0838667eb3adc/1000g00828idf6nofk05g5ohki5uk137o8beqcv8!nd_dft_wgth_webp_3"))
        assert(Source::URL.image_url?("https://ci.xiaohongshu.com/1000g00828idf6nofk05g5ohki5uk137o8beqcv8"))
        assert(Source::URL.image_url?("https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30s5tg4ugig605ohki5uk137o34ug2fo"))

        assert(Source::URL.page_url?("https://www.xiaohongshu.com/explore/6421b331000000002702901f"))
        assert(Source::URL.page_url?("https://www.xiaohongshu.com/user/profile/6234917d0000000010008cf8/6421b331000000002702901f"))
        assert(Source::URL.page_url?("https://www.xiaohongshu.com/discovery/item/65880524000000000700a643"))

        assert(Source::URL.profile_url?("https://www.xiaohongshu.com/user/profile/6234917d0000000010008cf8"))
      end
    end
  end
end
