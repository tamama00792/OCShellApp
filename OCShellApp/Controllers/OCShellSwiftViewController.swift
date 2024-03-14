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
        
        let titles = ["工程内Swift调用OC方法","组件内Swift调用OC方法","组件间Swift调用OC方法"];
        
        for (index,title) in titles.enumerated() {
            let ocButton = UIButton(type: .system)
            ocButton.setTitle(title, for: .normal)
            ocButton.addTarget(self, action: #selector(self.logOCUtil(_:)), for: .touchUpInside)
            ocButton.tag = 10000 + index
            view.addSubview(ocButton)
            ocButton.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
            ocButton.center = CGPoint(x: screenWidth / 2, y: screenHeight / 2 - 100 + CGFloat(index) * 100)
        }
    }
    
    @objc func logOCUtil(_ button:UIButton) {
        switch button.tag {
        case 10000:
            logSwiftUtilInsideSameProject()
        case 10001:
            logSwiftUtilInsideSamePod()
        case 10002:
            logSwiftUtilBetweenPods()
        default:
            break
        }
    }
    
    // 在壳工程内，Swift调用OC需要用到头文件XXX-Bridging-Header.h，并在里面引用需要被调用的OC文件。对应配置位置在【Build Settings】->【Swift Compiler - General】->【Objective-C Bridging Header】。在OC工程内创建Swift文件时会自动生成此配置。
    func logSwiftUtilInsideSameProject (){
        let info = "from \(#file)"
        OCShellOCUtils.logClassMethod(info)
        let util = OCShellOCUtils()
        util.logInstanceMethod(info)
    }
    
    // 在同一个pod内，Swift调用OC需要用到在XXX-umbrella.h头文件中，并在里面引用需要被调用的OC文件；另外还需要配置Defines Module为YES，位置在【Build Settings】->【Packaging】。当工程内同时有Swift和OC文件时，Cocoapods会自动生成此配置。
    func logSwiftUtilInsideSamePod (){
        SMOObjeciveCMethodCaller.logSwiftUtilInsideSamePod()
        let caller = SMOObjeciveCMethodCaller()
        caller.logSwiftUtilInsideSamePod()
    }
    
    func logSwiftUtilBetweenPods (){
        
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
