//
//  ViewController.swift
//  UITableViewExample
//
//  Created by 최민섭 on 01/08/2019.
//  Copyright © 2019 최민섭. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    
    //각 Cell에 대한 Data List
    private var doctersWords: [String] = []
    private var monsters: [Monster] = []
    //이미지 리소스, 셀 클래스 이름
    private let metamongImageSrc = UIImage(named: "metamong")
    private let turtleImageSrc = UIImage(named: "turtle")
    private let doctorImageSrc = UIImage(named: "doctor")
    private let MonsterCellString = String(describing: MonsterCell.self)
    
    //3개의 버튼에 대한 Action
    @IBAction func buttonAction(_ sender: UIButton) {
        switch sender.restorationIdentifier {
            case "addMetamong":
                monsters.append(Monster(imageSrc: metamongImageSrc!, name: "메타몽"))
                tableView.reloadSections(IndexSet(1...1), with: .automatic)
            case "addTurtle":
                monsters.append(Monster(imageSrc: turtleImageSrc!, name: "꼬부ㄱ..몽"))
                tableView.reloadSections(IndexSet(1...1), with: .automatic)
            default://doctor
                doctersWords.append(getDoctorsWord())
                tableView.reloadSections(IndexSet(0...0), with: .automatic)
        }
    }
    //오박사님의 말씀
    private func getDoctorsWord() -> String{
        //현재시간 가져오기
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        
        return "벌써 \(hour)시 \(minutes)분 이군! 이런이런 늦었구만"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UITableViewDelegate, UITalbeViewDataSource 등록
        tableView.delegate = self
        tableView.dataSource = self
        //외부 Cell 등록 -> 이 작업이 있어야 xib 파일을 가져다 쓸 수 있습니다.
        tableView.register(UINib(nibName: MonsterCellString, bundle: nil), forCellReuseIdentifier: MonsterCellString)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    //number of sections = 2 : doctor, monster
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    //section에 따른 행 높이 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 70
        }else{
            return 140
        }
    }
    //section에 따른 행(Data) 갯수 지정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return monsters.count
        }
        else{
            return doctersWords.count
        }
    }
    //section에 따른 cell 지정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 { //doctor
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorCell") else {
                    return UITableViewCell()
            }
            
            cell.textLabel?.text = doctersWords[indexPath.row]
            return cell
        }
        else{  //monster
            guard let cell: MonsterCell = tableView.dequeueReusableCell(withIdentifier: MonsterCellString, for: indexPath) as? MonsterCell else{
                    return UITableViewCell()
            }
            
            let monster = monsters[indexPath.row]
            cell.monsterImageView.image = monster.imageSrc
            cell.nameLabel.text = monster.name
            return cell
        }
    }
}

