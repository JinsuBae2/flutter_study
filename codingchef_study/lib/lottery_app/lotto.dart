import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_app/lottery_app/dialog.dart';
import 'dart:math';
import 'package:login_app/lottery_app/lotto_ball.dart';
import 'package:lottie/lottie.dart';

class Lotto extends StatefulWidget {
  const Lotto({super.key});

  @override
  State<Lotto> createState() => _LottoState();
}

class _LottoState extends State<Lotto> {
  List<List<int>> listLottery = [];
  void _createNumber() {
    if (listLottery.length < 15) {
      setState(() {
        List<int> lottery = [];
        while (true) {
          var rnd = Random().nextInt(45) + 1;
          if (!lottery.contains(rnd)) {
            lottery.add(rnd);
          }
          if (lottery.length == 6) {
            break;
          }
        }
        lottery.sort();
        listLottery.add(lottery);
      });
    } else {
      Fluttertoast.showToast(
        msg: "15번 까지만 생성 가능합니다.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
    }
  }

  void showPopup(context, String title, String number) {
    showDialog(
        context: context,
        builder: (context) {
          return PopupDialog(
            title2: title,
            number2: number,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 83, 125, 198),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 208, 105, 3),
        title: const Text('Lotto app'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: RawScrollbar(
                thumbColor: const Color.fromARGB(255, 122, 157, 218),
                thumbVisibility: true,
                trackVisibility: true,
                thickness: 15,
                radius: const Radius.circular(10),
                interactive: true,
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: listLottery.length,
                  itemBuilder: (BuildContext context, int index) {
                    int currentIndex = index + 1;
                    var path_1 = 'svg/${listLottery[index][0]}.svg';
                    var path_2 = 'svg/${listLottery[index][1]}.svg';
                    var path_3 = 'svg/${listLottery[index][2]}.svg';
                    var path_4 = 'svg/${listLottery[index][3]}.svg';
                    var path_5 = 'svg/${listLottery[index][4]}.svg';
                    var path_6 = 'svg/${listLottery[index][5]}.svg';
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          "$currentIndex번째 추첨 번호",
                          style: const TextStyle(
                            fontFamily: 'NanumGothic',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            showPopup(
                              context,
                              currentIndex.toString(),
                              listLottery[index].toString(),
                            );
                          },
                          icon: const Icon(
                            Icons.summarize_outlined,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                        subtitle: Scrollbar(
                          trackVisibility: true,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                LottoBall(path: path_1),
                                const SizedBox(
                                  width: 5,
                                ),
                                LottoBall(path: path_2),
                                const SizedBox(
                                  width: 5,
                                ),
                                LottoBall(path: path_3),
                                const SizedBox(
                                  width: 5,
                                ),
                                LottoBall(path: path_4),
                                const SizedBox(
                                  width: 5,
                                ),
                                LottoBall(path: path_5),
                                const SizedBox(
                                  width: 5,
                                ),
                                LottoBall(path: path_6),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              width: 150,
              height: 150,
              child: Lottie.asset('lottie/dog.json'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: _createNumber,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
