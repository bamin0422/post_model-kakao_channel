import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_post/screen/postadder.dart';
import 'package:flutter_post/screen/postlist.dart';


class InfoDialog {

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('개인정보 수집 및 이용목적'),
          content: SingleChildScrollView(
            child: new Text("▶ 개인정보의 수집 및 이용목적\n- 서비스 이용에 따른 본인식별, 실명확인, 가입의사 확인, 연령제한 서비스 이용\n- 고지사항 전달, 불만처리 의사소통 경로 확보, 물품배송 시 정확한 배송지 정보 확보\n 신규 서비스 등 최신정보 안내 및 개인맞춤서비스 제공을 위한 자료\n- 기타 원활한 양질의 서비스 제공 등\n\n▶ 수집하는 개인정보의 항목- 이름, 이메일, 주민등록번호, 주소, 연락처, 핸드폰번호, 그 외 선택항목\n\n▶ 개인정보의 보유 및 이용기간\n- 원칙적으로 개인정보의 수집 또는 제공받은 목적 달성 시 지체 없이 파기합니다.\n- 다만, 원활한 서비스의 상담을 위해 상담 완료 후 내용을 3개월간 보유할 수 있으며\n전자상거래에서의 소비자보호에 관한 법률 등 타법률에 의해 보존할 필요가 있는 경우에는 일정기간 보존합니다.")
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context, "OK");
                Navigator.push(context, MaterialPageRoute<void>(builder: (context) => PostAdder()));
              },
            ),
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context, "OK");
                Navigator.push(context, MaterialPageRoute<void>(builder: (context) => PostList()));
              },
            ),
          ],
        );
      },
    );
  }
}