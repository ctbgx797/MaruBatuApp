//
//  ViewController.swift
//  MarubatuApp
//
//  Created by 西谷恭紀 on 2019/06/08.
//  Copyright © 2019 西谷恭紀. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
    }
    @IBOutlet var questionLabel: UILabel!
    
    // 表示中の問題番号を格納
    var currentQuestionNum:Int = 0
    
    // 問題
    let questions: [[String:Any]] = [
        [
            "question": "iPhoneアプリを開発する統合環境はZcodeである",
            "answer": false
        ],
        [
            "question": "Xcode画面の右側にはユーティリティーズがある",
            "answer": true
        ],
        [
            "question": "UILabelは文字列を表示する際に利用する",
            "answer": true
        ],
        [
            "question": "やまちゃんはいけめん",
            "answer": true
        ]
    ]
    
    func showQuestion() {
        let question = questions[currentQuestionNum]
        //問題番号の中の辞書のKey値を見ている
        if let que = question["question"] as? String {
            questionLabel.text = que
        }
    }
    
    func checkAnswer(yourAnswer: Bool){
        let question = questions[currentQuestionNum]
        //問題番号の中の辞書のKey値を見ている
        if let ans = question["answer"] as? Bool {
            if yourAnswer == ans {
//                正解したら次の問題
                currentQuestionNum += 1
                showAlert(message: "正解")
            }else{
//                不正解
                showAlert(message: "不正解")
            }
        }else{
//          問題や解答がnilだった場合
            print("答えがありません")
            return
        }
        //currentQuestionNumがquestions.count(questionsの中の配列の数)より大きかったら
        if currentQuestionNum >= questions.count{
            currentQuestionNum = 0
        }
        showQuestion()
        print(questions.count)
    }
    
//    アラート文
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func tapNoButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: false)
    }
    
    @IBAction func tapYesButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: true)
    }
}

