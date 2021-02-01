import 'package:flutter/material.dart';
import 'package:rhacafe_business/search_by_contact_delegate.dart';
import 'qr_scan_screen.dart';

class LoyaltyTabScreen extends StatefulWidget {

  @override
  _LoyaltyTabScreenState createState() => _LoyaltyTabScreenState();
}

class MileageOption {

  MileageOption({this.qty});

  final int qty;

  Widget presentation(){
    return Row(
      children: <Widget>[
        Icon(Icons.check_circle_outline),
        qty == 0 ? Text(' x ?') : Text(' x $qty'),
      ],
    );
  }
}

List<MileageOption> options = <MileageOption>[
  MileageOption(qty: 1),
  MileageOption(qty: 2),
  MileageOption(qty: 3),
  MileageOption(qty: 0)
];

class _LoyaltyTabScreenState extends State<LoyaltyTabScreen> {

  int selectedOption = -1;
  bool isLocked = false;

  @override
  Widget build(BuildContext context) {


    //TODO 1 먼저 위에 적립 스탬프를 표시할 수 있는 바를 생성, 이후 actionchip 형태로 각 스탬프 설정가능하도록
    //TODO 2 버튼 2개 간략하게 만듦
    //TODO 3 QR 코드 스캐너 구현

    print("LoyaltyTabScreen");

    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Row(
                  children: options.map((e) =>
                  ChoiceChip(
                    label: e.presentation(),
                    selectedColor: Colors.brown,
                    selectedShadowColor: Colors.brown,
                    selected: selectedOption == e.qty,
                    onSelected: (selected) {
                      isLocked ? print('locked') :
                      setState(() {
                        selectedOption == e.qty ? selectedOption = -1 :
                        selectedOption = e.qty;
                      });
                    },
                  )
                  ).toList(),
                ),

                Spacer(),

                FlatButton(
                  child: isLocked == false ? Icon(Icons.lock_open) : Icon(Icons.lock_outline),
                  onPressed: (){
                    setState(() {
                      isLocked = !isLocked;
                    });
                  },
                )
              ],
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => QRScanScreen()));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.greenAccent
              ),
              height: 150,
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.check),
                    Spacer(),
                    Text(
                      'QR 코드로 적립하기'
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          //TODO 1 먼저 눌렀을 때 별도 페이지 or Dialog로 라우팅되서 연락처 뒤에 입력했을 때
          //유저를 보여주고(첫 번째 쿼리) 이후 유저 이름을 클릭하면 정보 열람과 적립 가능하게

          //TODO 2 QR 코드에는 어떤 식으로 정보를 내재할까?
          //Accounts - UID + CafeVisits - CafeID
          InkWell(
            onTap: (){
//              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactLoyaltyScreen()));
              showSearch(context: context, delegate: SearchByContactDelegate());
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.cyanAccent
              ),
              height: 50,
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.check),
                    Spacer(),
                    Text(
                        '연락처로 적립하기'
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
