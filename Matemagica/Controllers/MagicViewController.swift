//
//  MagicViewController.swift
//  Math Magic
//
//  Created by Daniel Springer on 05/07/2018.
//  Copyright © 2022 Daniel Springer. All rights reserved.
//

import UIKit


class MagicViewController: UIViewController {


    // MARK: Outlets

    @IBOutlet weak var headerLabel: UILabel!

    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var middleButton: UIButton!


    // MARK: Properties

    var myTitle: String!
    let myThemeColor: UIColor = .systemRed


    // MARK: Life Cicle

    override func viewDidLoad() {
        super.viewDidLoad()

        leftButton.isHidden = true
        rightButton.isHidden = true

        middleButton.removeTarget(nil, action: nil, for: .allEvents)
        middleButton.addTarget(self, action: #selector(play), for: .touchUpInside)
        middleButton.setTitle(Const.Misc.okMessage, for: .normal)
        middleButton.sizeToFit()

        self.title = self.myTitle
        setThemeColorTo(myThemeColor: myThemeColor)

        headerLabel.text = """
        Think of a number (you might want pen and paper)

        Let us call your number: A
        """
    }


    // MARK: Helpers

    @objc func play() {
        headerLabel.text = """
        Now do: A + 10

        Let us call the result: B
        """

        middleButton.removeTarget(nil, action: nil, for: .allEvents)
        middleButton.addTarget(self, action: #selector(combineFirst), for: .touchUpInside)
        middleButton.setTitle(Const.Misc.okMessage, for: .normal)
        middleButton.sizeToFit()
    }


    @objc func combineFirst() {
        headerLabel.text = """
        Combine the digits of B

        For example, if B was 24, you would get 2 + 4 = 6

        Let us call the result of combining B's digits: C
        """

        middleButton.removeTarget(nil, action: nil, for: .allEvents)
        middleButton.addTarget(self, action: #selector(subtract), for: .touchUpInside)
        middleButton.setTitle(Const.Misc.okMessage, for: .normal)
        middleButton.sizeToFit()
    }


    @objc func subtract() {
        headerLabel.text = """
        Now do: B - C

        Let us call the result: D
        """

        middleButton.removeTarget(nil, action: nil, for: .allEvents)
        middleButton.addTarget(self, action: #selector(checkFirst), for: .touchUpInside)
        middleButton.setTitle(Const.Misc.okMessage, for: .normal)
        middleButton.sizeToFit()
    }


    @objc func checkFirst() {
        headerLabel.text = """
        Is D a single digit?
        """

        leftButton.isHidden = false
        middleButton.isHidden = true
        rightButton.isHidden = false

        leftButton.removeTarget(nil, action: nil, for: .allEvents)
        rightButton.removeTarget(nil, action: nil, for: .allEvents)
        leftButton.addTarget(self, action: #selector(combineSecond), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(showResultFirst), for: .touchUpInside)
        rightButton.setTitle(Const.Misc.yesMessage, for: .normal)
        leftButton.setTitle(Const.Misc.noMessage, for: .normal)
        leftButton.sizeToFit()
        rightButton.sizeToFit()

    }


    @objc func combineSecond() {
        headerLabel.text =
        """
        Combine the digits of D

        For example, if D was 24, you would get 2 + 4 = 6
        """

        leftButton.isHidden = true
        middleButton.isHidden = false
        rightButton.isHidden = true

        middleButton.removeTarget(nil, action: nil, for: .allEvents)
        middleButton.addTarget(self, action: #selector(checkForever), for: .touchUpInside)
        middleButton.setTitle(Const.Misc.okMessage, for: .normal)
        middleButton.sizeToFit()
    }


    @objc func checkForever() {
        headerLabel.text = "Is the new result a single digit?"

        leftButton.isHidden = false
        middleButton.isHidden = true
        rightButton.isHidden = false

        leftButton.removeTarget(nil, action: nil, for: .allEvents)
        rightButton.removeTarget(nil, action: nil, for: .allEvents)
        leftButton.addTarget(self, action: #selector(combineForever), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(showResultFinally), for: .touchUpInside)
        rightButton.setTitle(Const.Misc.yesMessage, for: .normal)
        leftButton.setTitle(Const.Misc.noMessage, for: .normal)
        leftButton.sizeToFit()
        rightButton.sizeToFit()
    }


    @objc func combineForever() {
        headerLabel.text =
        """
        Combine the result's digits. For example, if your result is 24, do 2 + 4, and get 6
        """

        leftButton.isHidden = true
        middleButton.isHidden = false
        rightButton.isHidden = true

        middleButton.removeTarget(nil, action: nil, for: .allEvents)
        middleButton.addTarget(self, action: #selector(checkForever), for: .touchUpInside)
        middleButton.setTitle(Const.Misc.okMessage, for: .normal)
        middleButton.sizeToFit()
    }


    @objc func showResultFirst() {
        headerLabel.text = "D is: 9"

        leftButton.isHidden = true
        middleButton.isHidden = false
        rightButton.isHidden = true

        middleButton.removeTarget(nil, action: nil, for: .allEvents)
        middleButton.addTarget(self, action: #selector(done), for: .touchUpInside)
        middleButton.setTitle(Const.Misc.endMessage, for: .normal)
        middleButton.sizeToFit()
    }


    @objc func showResultFinally() {
        headerLabel.text = "You now have: 9"

        leftButton.isHidden = true
        middleButton.isHidden = false
        rightButton.isHidden = true

        middleButton.removeTarget(nil, action: nil, for: .allEvents)
        middleButton.addTarget(self, action: #selector(done), for: .touchUpInside)
        middleButton.setTitle(Const.Misc.endMessage, for: .normal)
        middleButton.sizeToFit()
    }


    @objc func done() {
        navigationController?.popToRootViewController(animated: true)
    }

}