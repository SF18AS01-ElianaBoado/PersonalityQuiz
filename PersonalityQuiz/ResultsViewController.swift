//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Eliana Boado on 2/5/19.
//  Copyright © 2019 Eliana Boado. All rights reserved.
//

import UIKit;

class ResultsViewController: UIViewController {
    
    var responses: [Answer]!;

    @IBOutlet weak var resultAnswerLabel: UILabel!;
    @IBOutlet weak var resultDefinitionLabel: UILabel!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        navigationItem.hidesBackButton = true;
        calculatePersonalityResult();

        // Do any additional setup after loading the view.
    }
    
    func calculatePersonalityResult() {
        var frequencyOfAnswers: [AnimalType: Int] = [AnimalType: Int]();   //dictionary
        let responseTypes: [AnimalType] = responses.map {$0.type}
    
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1;
        }
        
        let frequentAnswersSorted: [(key: AnimalType, value: Int)] = frequencyOfAnswers.sorted {$0.1 > $1.1}
        let mostCommonAnswer: AnimalType = frequentAnswersSorted.first!.key;
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!";
        resultDefinitionLabel.text = mostCommonAnswer.definition;
    }
    

}
