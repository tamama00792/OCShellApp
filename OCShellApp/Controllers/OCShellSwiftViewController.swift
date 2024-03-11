//
//  OCSSwiftViewController.swift
//  OCShellApp
//
//  Created by 徐冰 on 2024/3/11.
//

import UIKit

class OCShellSwiftViewController: UIViewController {
    
    required init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "Swift容器页"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        generateOCButton()
    }
    
    func generateOCButton() {
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        // Do any additional setup after loading the view.
        let ocButton = UIButton(type: .system)
        ocButton.setTitle("Swift调用OC方法", for: .normal)
        ocButton.addTarget(self, action: #selector(self.logOCUtil), for: .touchUpInside)
        
        view.addSubview(ocButton)
        ocButton.frame = CGRect(x: 0, y: 0, width: 150, height: 30)
        ocButton.center = CGPoint(x: screenWidth / 2, y: screenHeight / 2)
    }
    
    @objc func logOCUtil() {
        let info = "from \(#file)"
        OCShellOCUtils.logClassMethod(info)
        let util = OCShellOCUtils()
        util.logInstanceMethod(info)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
