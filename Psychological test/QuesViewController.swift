//
//  QuesViewController.swift
//  Psychological test
//
//  Created by 林銘 on 2019/11/22.
//  Copyright © 2019 林家銘. All rights reserved.
//

import UIKit

class QuesViewController: UIViewController {

    let questions = [Qusetinonlist(question: "在工作中你非常的賣力，希望得到領導的認可，並且希望得到晉升。", choice: ["是的","還可以","不是"],imageName: ""),Qusetinonlist(question: "下面圖片給你什麼樣的感覺？", choice: ["眼花繚亂、心慌","溫馨、安詳","冷清、落寞"],imageName: "q2"),Qusetinonlist(question: "下面圖片你看到了什麼？", choice: ["兩個老頭在吵架","兩個人在傳功","跳芭蕾的女孩"],imageName: "q3"),Qusetinonlist(question: "下面圖片將要發生什麼？", choice: ["老頭要殺躺在床上的人","老頭要給他蓋被子","老頭是醫生，正在給病人催眠"],imageName: "q4"),Qusetinonlist(question: "當你的朋友誤解你並且跟你吵架後，你會怎麼做？", choice: ["絕交","解釋","忍著"],imageName: "")]
    
    
    @IBOutlet weak var questinonLabel: UILabel!
    
    @IBOutlet var choiceButton: [UIButton]!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var sumLabel: UILabel!
    
    @IBOutlet weak var lastanwerLabel: UILabel!
    
    var index = 0
    var score0 = 0
    var score1 = 0
    var score2 = 0
    var sum = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //畫面載入顯示第一題
        sumLabel.isHidden = true
       lastanwerLabel.isHidden = true
       questinonLabel.text = questions[0].question
       image.image = UIImage(named: questions[0].imageName)
       choiceButton[0].setTitle(questions[0].choice[0], for: .normal)
       
       choiceButton[1].setTitle(questions[0].choice[1], for: .normal)
       
       choiceButton[2].setTitle(questions[0].choice[2], for: .normal)
        
    
    }
    
    
//選擇哪個
    @IBAction func ButtonPress(_ sender: UIButton) {
        
        if sender.tag == 0{
        
        next()
        
        if sender.tag == 0{
            score0 = score0 + 1
        }
        if sender.tag == 1{
            score1 = score1 + 2
        }
        if sender.tag == 2{
            score2 = score2 + 3
        }
        
        sum = 1 + score0 + score1 + score2
        
        }else if sender.tag == 1{
            next()
            
            if sender.tag == 0{
                score0 = score0 + 1
            }
            if sender.tag == 1{
                score1 = score1 + 2
            }
            if sender.tag == 2{
                score2 = score2 + 3
            }
            
            sum = 2 + score0 + score1 + score2
        }else if sender.tag == 2{
            next()
            
            if sender.tag == 0{
                score0 = score0 + 1
            }
            if sender.tag == 1{
                score1 = score1 + 2
            }
            if sender.tag == 2{
                score2 = score2 + 3
            }
            
            sum = 3 + score0 + score1 + score2
        }
    
    }
    
    
    //下一題
    func next(){
    
    if index < questions.count - 1{
        index = index + 1
        sumLabel.isHidden = true
        lastanwerLabel.isHidden = true
        questinonLabel.text = questions[index].question
        image.image = UIImage(named: questions[index].imageName)
        
        choiceButton[0].setTitle(questions[index].choice[0], for: .normal)
        
        choiceButton[1].setTitle(questions[index].choice[1], for: .normal)
        
        choiceButton[2].setTitle(questions[index].choice[2], for: .normal)
    }else{
        questinonLabel.isHidden = true
        choiceButton[0].isHidden = true
        choiceButton[1].isHidden = true
        choiceButton[2].isHidden = true
        image.isHidden = true
        sumLabel.isHidden = false
        lastanwerLabel.isHidden = false
        sumLabel.text = "你的總分為\(sum)"
        if sum > 4 , sum < 10{
            lastanwerLabel.text = "A型人格：你的性格比較急躁並且缺乏一定的耐性，工作上面有著非常強的上進心，能吃苦肯做事，有不小的野心，希望取得較高的成就。平時對於時間的安排較為緊張，因此生活中也總是處在緊張的狀態，對於社會的適應能力薄弱，屬於不安定型的人格。你有點類似血色浪漫里的鐘躍民，是那種永遠走在路上的人！"
        }else if sum > 9,sum < 13{
            lastanwerLabel.text = "B型人格：你的性格不溫不火，言談行為舉止都比較得當，對於工作和生活有著較強的滿足感，比較喜歡慢節奏的生活，做事情不緊不慢，慢條斯理的。情緒的活動強度較小，具有很好的穩定性和持久力，不容易激動，情緒平穩，有著大將風範，泰山崩於前而色不變，麋鹿行與左而目不瞬。"
        }else if sum > 12,sum < 16{
            lastanwerLabel.text = "C型人格：你的性格有意的克制和壓抑，對於負面的情緒保持著深深的壓抑，特別是對於憤怒的壓抑，因此你常常生悶氣，儘量迴避各種衝突，常常會原諒一些本來不值得原諒的事情，對別人有著一種過分的寬容，忍讓和耐心，往往屈從於權威，缺乏個人主見，時常會有孤獨感和失助感。"
        }
    }
        
        


 
  

}

}
