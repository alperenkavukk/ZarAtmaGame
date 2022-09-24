//
//  ViewController.swift
//  ZarGame
//
//  Created by Alperen Kavuk on 24.09.2022.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var player1scorelbl: UILabel!
    
    @IBOutlet weak var player2Scorelbl: UILabel!
    
    @IBOutlet weak var player1Pointlbl: UILabel!
    
    @IBOutlet weak var player2PointLbl: UILabel!
    @IBOutlet weak var imgplayer1State: UIImageView!
    
    @IBOutlet weak var imgplayer2State: UIImageView!
    @IBOutlet weak var imgZar1: UIImageView!
    
    @IBOutlet weak var SetScorelbl: UILabel!
    @IBOutlet weak var imgZar2: UIImageView!
    
    
    var playersScores = (oneplayerScore : 0, secondPlayerScore : 0)
    var playersPoint = (oneplayerPoint : 0 , secondplayerPoint : 0)
    var oyuncuSira : Int = 1
    var maxSetSayisi : Int = 5
    var SuanKiSet : Int = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
        
        // Do any additional setup after loading the view.
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
       
        if SuanKiSet > maxSetSayisi {
            return
        }
        
        
        zarDegerleriUret()
    }
    
    
    func setSonucu(zar1 : Int , zar2 : Int){
        if oyuncuSira == 1
        {
            playersPoint.oneplayerPoint = zar1 + zar2
            player1Pointlbl.text = String(playersPoint.oneplayerPoint)
            imgplayer1State.image = UIImage(named: "bekle")
            imgplayer2State.image = UIImage(named: "onay")
            
            SetScorelbl.text = "Sıra 2. Oyuncuda"
            oyuncuSira = 2
            player2PointLbl.text = "0"
            
        }
        else
        {
            playersPoint.secondplayerPoint = zar1 + zar2
            player2PointLbl.text = String(playersPoint.secondplayerPoint)
            imgplayer1State.image = UIImage(named: "onay")
            imgplayer2State.image = UIImage(named: "bekle")
            oyuncuSira = 1
            
            if playersPoint.oneplayerPoint > playersPoint.secondplayerPoint {
                
                playersScores.oneplayerScore += 1
                SetScorelbl.text = "Seti 1.player win"
                
                SuanKiSet += 1
                player1scorelbl.text = String(playersScores.oneplayerScore)
            }
            else if playersPoint.oneplayerPoint < playersPoint.secondplayerPoint{
                
                playersScores.secondPlayerScore += 1
                SetScorelbl.text = "Seti 2.player win"
                
                SuanKiSet += 1
                player2Scorelbl.text = String(playersScores.secondPlayerScore)
                
                
            }
            else {
                SetScorelbl.text = "Set berabere sona erdi"
            }
            playersScores.oneplayerScore = 0
            playersScores.secondPlayerScore = 0

        }
        
    }
    
    
    func zarDegerleriUret(){
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3){
            
            let zar1 = arc4random_uniform(6) + 1
            let zar2 = arc4random_uniform(6) + 1
            
            self.imgZar1.image = UIImage(named: String(zar1))
            self.imgZar2.image = UIImage(named: String(zar2))
            
            self.setSonucu(zar1: Int(zar1), zar2: Int(zar2))
            
            if self.SuanKiSet > self.maxSetSayisi {
                
                if self.playersScores.oneplayerScore > self.playersScores.secondPlayerScore {
                    
                    self.SetScorelbl.text = "1. OYUNCU KAZANDI"
                }
                else {
                    self.SetScorelbl.text = "2. OYUNCU KAZANDI"
                }
            }
            
            
        }
        SetScorelbl.text = "\(oyuncuSira). Oyuncusu için Zar Değeri Üretiliyor"
        imgZar1.image = UIImage(named: "bilinmeyenzar")
        imgZar2.image = UIImage(named: "bilinmeyenzar")

        }
        
        
}

