#import "../lib.typ": setup

#let (
  make_cover,
  make_abstract_en,
  make_abstract_zh_tw,
  make_acknowledge_en,
  make_acknowledge_zh_tw,
  make_outline,
  make_ref,
  whole,
  extended_abstract_en,
  mainmatter_or_appendix,
) = setup(
  in_degree: (master: false, doctor: true),
  in_institute: "Department of Electrical Engineering",
  in_title: (
    en: "A Thesis/Dissertation Template written in Typst for National Cheng Kung University",
    zh_tw: "以 Typst 撰寫之國立成功大學碩博士論文模板論文模板",
  ),
  in_student: (en: "Chun-Hao Chang", zh_tw: "張峻豪"),
  in_advisor: (en: "Dr. Chia-Chi Tsai", zh_tw: "蔡家齊 博士"),
  in_coadvisor: (
    (en: "Dr. Ha-Ha Lin", zh_tw: "林哈哈 博士"),
  ), // must make this argument be a array which contains one or many dict, so the trailing comma is important for the scenario with only one co-advisor
  in_main_lang: (en: true, zh_tw: false),
)

#show: whole

// NOTE: generate cover page
#make_cover()

#set page(numbering: "i")
#counter(page).update(1)

#make_abstract_zh_tw(keywords: ("關鍵字一", "關鍵字二", "關鍵字三"))[
  // NOTE: type your abstract (chinese ver.) here...

  哥又昔高昌禾兌辛收衣由抱人乍對裝弓昌姊貫，竹麼八送呀告鴨方草抄，白馬示扒習母升吧把個杯欠澡是法相起。

  丟員跳前加色實着前王隻，遠許卜辛兌寺而飽用麻昔爪六婆安海爸：外斗片室園很明害沒送回英每上旦放首菜，反夕白細升晚借夏壯小春肉住開正路寸室免抓品。

  聽尾荷點師蝴連千。聲雄加果笑時開活流學子方二室，筆河右停反六斗登禾麼花買樹世北再村，經少福犬香國；媽新晚遠媽九個即門巾「着亮什媽入」竹子。

  東具耳穴朋以朱花辛哥布地泉美占游回，手想走婆。清朵枝送叫。占蛋葉食借母百千「很前頭哪鼻畫太合良新」叫愛休您語正山陽澡刀出院聽珠尼品奶亭出，春每今口員很師晚游唱、兆長固海棵花片節聽右葉王因立，草知足。

  日公枝香，澡物愛荷鴨。好您尾葉常古燈幾怎尺耍話消氣我加七免冬斤：三自對那同友昔歌了去屋肉穿耳風「害手斤兒問美里室木北」活且是兄飯習開事這步身旦；見至兒樹福沒定田九海。學枝假。

  又雄連放做？木公書第良扒：口豆米兩直太多主有。視視高目邊年面鳥面占吹同士，汁假朱未今東雞走很夕者牠。白抄比雪公裝一毛汁音卜耳就，裏屋室朋何亭南珠細兔忍主泉麼？助游登新西讀甲條高七或新食扒種風黑法祖空。

  娘唱卜夕字爸次黃。神坡犬功！象吹里母，象干包頭。
]

#make_abstract_en(keywords: ("key 1", "key 2", "key 3"))[
  // NOTE: type your abstract (english ver.) here...

  #lorem(200)

  #lorem(100)
]

// NOTE: include extended abstract (english ver.)
#include "contents/extended-abstract-en.typ"

#make_acknowledge_zh_tw[
  #lorem(250)
]

#make_acknowledge_en[
  #lorem(250)
]

// NOTE: generate outline (includes list-of-table and list-of-figure)
#make_outline()

// NOTE: imclude mainmatter part
#include "contents/mainmatter.typ"

// NOTE: generate reference section
#make_ref("../template/ref.bib")

// NOTE: include appendices
#include "contents/appendix.typ"
