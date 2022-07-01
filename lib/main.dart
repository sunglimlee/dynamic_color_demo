// ignore_for_file: avoid_print

import 'package:dynamic_color_demo/circular_border_avatar.dart';
import 'package:dynamic_color_demo/my_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// 통일된 색깔로 바꿀 수 있는 앱 (Color & Theme)
void main() {
  runApp(const DynamicColorDemo());
}

const seedColor = Color(0xff6e6d14);
const outPadding = 32.0;

class DynamicColorDemo extends StatelessWidget {
  const DynamicColorDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData( // MaterialApp 에다가 ThemeData 의 인스턴스를 넘겨주었네
        /***
         * You can also do this instead of ColorScheme.fromSeed()
         */
        colorSchemeSeed: seedColor,
        brightness: Brightness.dark,
        // colorScheme: ColorScheme.fromSeed(
        //     seedColor: seedColor, brightness: Brightness.dark),
        textTheme: GoogleFonts.gugiTextTheme(
          Theme.of(context)
              .textTheme, // If this is not set, then ThemeData.light().textTheme is used.
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Stack( // 스택이 리턴된다. ?
      children: [
        Container(color: Theme.of(context).colorScheme.primary), // Container 가 전체적으로 그려지는 것 맞지? 왜냐면 Stack 안의 레이어로 있으니깐..
        Scaffold( // 여기 보듯이 내가 넣은건데 아무문제 없이 Scaffold 가 두번 들어간다. 대신 무조건 부모의 백그라운드 컬러를 받지만 Colors.transparent 해주면 된다.
          backgroundColor: Colors.transparent,
        body : Container( // 이 컨테이너도 전체적드로 그리겠네.
          decoration: const BoxDecoration( // 그라디언트, 마치 사진처럼 쓸 수 있네.
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white10,
              Colors.white10,
              Colors.black12,
              Colors.black54,
              Colors.black12,
              Colors.black87,
            ],
          )),
        ),),
        Scaffold( // Stack 이고 Scaffold 는 언제든지 들어갈 수 있지..
          backgroundColor: Colors.transparent,
          bottomNavigationBar: BottomNavigationBar( // 내가 원하는 BottomNavigationBar 를 만들어서 넣어줄 수 있고..
            currentIndex: _selected,
            elevation: 0,
            onTap: (selected) {
              setState(() {
                _selected = selected;
                print(_selected);
              });
            },
            selectedItemColor: Theme.of(context).colorScheme.onPrimary,
            unselectedItemColor:
                Theme.of(context).colorScheme.onPrimaryContainer,
            items: const [
              BottomNavigationBarItem( // 아이템을 이렇게 만드는구나.
                  icon: Icon(Icons.home_outlined),
                  label: "홈으로",
                  backgroundColor: Colors.transparent),
              BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper_outlined),
                  label: "News",
                  backgroundColor: Colors.transparent),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: "",
                  backgroundColor: Colors.transparent),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_outlined),
                  label: "",
                  backgroundColor: Colors.transparent),
            ],
          ),
          body: SafeArea( // 안드로이드, 아이폰 탈모나 굴곡진 부분을 제외하고 보여주는 거네... 미친다. 이런것도 있네.. 당연히 있어야겠지.
            child: Padding(
                padding: const EdgeInsets.all(outPadding),
              child: Column(
                /* Row 와 Column 에서 자식들을 정렬하는 방법인데 Row 는 세로로, Column 은 가로로 자식들을 정렬한다.
                   여기서 헷갈리지 말아야 하는게 이 예제에서 보듯이 Column 이므로 자식들을 맨 왼쪽에서부터 정렬한다. 즉 start 에서
                */
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.ac_unit,
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: 32,
                      ),
                      Expanded(child: Container()), // 이렇게 했기 때문에 넘어가지 않는다.
                      CircularBorderAvatar( // 알지? 여기에 인터넷의 이미지 갖다 쓸 수 있다는 거..
                        'https://images.unsplash.com/photo-1561373725-d173c9d4c5fc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
                        borderColor: Theme.of(context).colorScheme.onPrimary,
                      )
                    ],
                  ),
                  const SizedBox( // 공백 주려고 만든것
                    height: outPadding,
                  ),
                  Text(
                    '안녕! 프로그래머,',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith( // 텍스트 크기
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '6개의 매세지가 기다려요.',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  const SizedBox(
                    height: outPadding,
                  ),
                  const _TopCard(),
                  const SizedBox(
                    height: outPadding,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Monthly Review',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                      const _ActionBtn()
                    ],
                  ),
                  const SizedBox(
                    height: outPadding,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Flexible(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch, // 이거 상당히 괜찮다. 채워주니깐..
                          children: [
                            Flexible(
                              flex: 3,
                              child: MyContainer(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center, // 알겠지? 중간으로 모아주는것.
                                  children: [
                                    Text(
                                      '22',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimaryContainer,
                                              fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'done',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimaryContainer),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: outPadding,
                            ),
                            Flexible(
                              flex: 2,
                              child: MyContainer(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '7',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimaryContainer,
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'in progress',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimaryContainer),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                        const SizedBox( // 이렇게 Row 의 공간을 띄우는구나.
                          width: outPadding,
                        ),
                        Flexible(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Flexible( // Flexible 참 멋지네.. 이렇게 전체를 나누어 주는거봐라.
                              flex: 2,
                              child: MyContainer(
                                // You can use the widget Expanded for each container inside the column. 
                                // And then use flex to make the correct adjustments.
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '10',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimaryContainer,
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'on going',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimaryContainer),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: outPadding,
                            ),
                            Flexible(
                              flex: 3,
                              child: MyContainer(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '12',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimaryContainer,
                                              fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'waiting for review',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimaryContainer),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _ActionBtn extends StatelessWidget {
  const _ActionBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration( // BoxDecoration 인데 동그라미로 사용된다
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.tertiary,
          boxShadow: [ // 여기에 박스 쉐도우를 2개를 주어서 색깔을 흰색과 검정 두개를 나누어 줄 수 있네.
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow.withAlpha(130),
              blurRadius: 8.0, // soften the shadow
              spreadRadius: 4.0, //extend the shadow
              offset: const Offset(
                8.0, // Move to right 10  horizontally
                8.0, // Move to bottom 10 Vertically
              ),
            ),
            BoxShadow(
              color: Colors.white.withAlpha(130),
              blurRadius: 8.0, // soften the shadow
              spreadRadius: 4.0, //extend the shadow
              offset: const Offset(
                -8.0, // Move to right 10  horizontally
                -8.0, // Move to bottom 10 Vertically
              ),
            ),
          ]),
      child: Icon(
        Icons.calendar_today_rounded,
        color: Theme.of(context).colorScheme.onTertiary,
        size: 16,
      ),
    );
  }
}

class _TopCard extends StatelessWidget {
  const _TopCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Your New Design is here!',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
          Text(
            'Sunglim (Steve) Lee',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(

            height: 32, //여기에 heigh 를 만들어 놨네
            child: Stack( // 보이지? 여기 작은부분에 Stack 들어간것
              children: [
                Positioned(
                  left: 0,
                  width: 32,
                  top: 0,
                  bottom: 0,
                  child: CircularBorderAvatar(
                    'https://randomuser.me/api/portraits/women/68.jpg',
                    borderColor:
                        Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                Positioned(
                  left: 22,
                  width: 32,
                  top: 0,
                  bottom: 0,
                  child: CircularBorderAvatar(
                    'https://randomuser.me/api/portraits/women/90.jpg',
                    borderColor:
                        Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                Positioned( // stack 과 함께 쓰자. Positioned 괭장히 중요하다.
                  right: 0, // Positioned 이거 Stack 하고 같이 쓰면 상당히 괜찮네.. 거기다. right 으로 설정할 수 도 있고.
                  bottom: 0,
                  child: Text(
                    'now',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
