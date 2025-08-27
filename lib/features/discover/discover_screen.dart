import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

// 탭 이름 목록
final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  // 검색 입력 관리용 컨트롤러 (반드시 dispose에서 정리)
  final TextEditingController _textEditingController =
      TextEditingController(text: "Initial Text");

  // 탭 전환(탭 클릭/스와이프) 시 키보드를 닫기 위해 TabController 감시
  TabController? _tabController;
  bool _tabListenerAttached = false;

  // 탭 변경 이벤트가 발생하면 포커스를 해제해 키보드를 닫는다
  void _handleTabChange() {
    // 탭이 변경되면 키보드 닫기 (탭 클릭/스와이프 모두 대응)
    FocusScope.of(context).unfocus();
  }

  void _onSearchChanged(String value) {
    // 실제 검색 로직은 데이터 연동 시 구현
    // 현재는 입력 이벤트만 콘솔 출력
    // ignore: avoid_print
    print("Searching for $value");
  }

  void _onSearchSubmitted(String value) {
    // 제출 시 동작도 동일 (필요 시 검색 실행 트리거)
    // ignore: avoid_print
    print("Submitted $value");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // DefaultTabController가 제공하는 TabController에 리스너 한 번만 등록
    final controller = DefaultTabController.maybeOf(context);
    if (controller != null && !_tabListenerAttached) {
      _tabController = controller;
      _tabController!.addListener(_handleTabChange);
      _tabListenerAttached = true;
    }
  }

  @override
  void dispose() {
    // 등록한 리스너 해제 및 컨트롤러 정리
    _tabController?.removeListener(_handleTabChange);
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 60,
          titleSpacing: 0,
          // 검색창 좌우 여백 부여
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
            child: CupertinoSearchTextField(
              controller: _textEditingController,
              onChanged: _onSearchChanged,
              onSubmitted: _onSearchSubmitted,
            ),
          ),
          bottom: TabBar(
            splashFactory: NoSplash.splashFactory,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            isScrollable: true,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            tabAlignment: TabAlignment.start,
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade500,
            // 탭을 터치해서 전환할 때도 키보드를 닫는다
            onTap: (_) => FocusScope.of(context).unfocus(),
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              // 스크롤 드래그 시 키보드가 자동으로 닫히도록 설정
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: 20,
              padding: const EdgeInsets.all(
                Sizes.size6,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
                childAspectRatio: 9 / 20,
              ),
              itemBuilder: (context, index) => Column(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.size4),
                    ),
                    child: AspectRatio(
                      aspectRatio: 9 / 16,
                      child: FadeInImage.assetNetwork(
                        fit: BoxFit.cover,
                        placeholder: "assets/images/placeholder.jpg",
                        image:
                            "https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80",
                      ),
                    ),
                  ),
                  Gaps.v10,
                  const Text(
                    "This is a very long caption for my tiktok that im upload just now currently.",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: Sizes.size14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v8,
                  DefaultTextStyle(
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w600,
                      fontSize: Sizes.size12,
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 10,
                          backgroundImage: NetworkImage(
                            "https://avatars.githubusercontent.com/u/3612017",
                          ),
                        ),
                        Gaps.h4,
                        const Expanded(
                          child: Text(
                            "My avatar is going to be very long",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Gaps.h2,
                        FaIcon(
                          FontAwesomeIcons.heart,
                          size: Sizes.size12,
                          color: Colors.grey.shade600,
                        ),
                        Gaps.h2,
                        const Text(
                          "2.5M",
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(
                  tab,
                  style: const TextStyle(
                    fontSize: 28,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
