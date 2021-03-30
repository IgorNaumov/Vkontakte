//
//  NewsTableViewController.swift
//  Vkontakte
//
//  Created by Игорь Наумов on 20.02.2021.
//

import UIKit
import Alamofire

class NewsTableViewController: UITableViewController {
    
   
      
            
       

    
            let news: [News] = [
        News(nameUser: "Гоча Чивчян", dateNews: "24 апр 2020", avatarUser: "news1", photosNews: "newsPost1", labelNews: "Из года в год ФОРВАРД АВТО разбирает мою машину до такого состояния, чтобы внимательно изучить, отдефектовать и привести в боевую готовность каждую деталь. И каждый раз мы понимаем, что работа проделана не зря, потому что только такой подход даёт уверенность в машине на 100%!"),
        News(nameUser: "Аркадий Цареградцев", dateNews: "27 апр 2020", avatarUser: "user2", photosNews: "post2", labelNews: "Свершилось! Гоча представил наконец то идеологического брата моей 370Z и скоро выкатит его на тесты (надеюсь). Конструктивно у нас очень похожи подвески (но не взаимозаменяемы), VR как силовая установка, коробка у ГТР осталось сзади (использован Самсонас в связке с винтерсом) и вес на предпусковой стадии 1250. И вот мне очень интересно, как это достаточно габаритно большая, но конструктивно интересная штука поедет? Жду весенних тестов с нетерпением и сам себя на них уже пригласил! Даёшь ГТР вместо Сильвии в сезоне 2021")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFromVK ()
        self.title = "Новости"
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int { 1 }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { news.count }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "news", for: indexPath) as! NewsTableViewCell
        let post  = news[indexPath.row]
        cell.labelNewsUser.text = post.nameUser
        cell.dateNew.text = post.dateNews
        cell.avatarUserNewws.image = post.avatarUser
        cell.photoNews.image = post.photosNews
        cell.labelNews.text = post.labelNews
        
        
        
        return cell
    }
    
    
    
}
