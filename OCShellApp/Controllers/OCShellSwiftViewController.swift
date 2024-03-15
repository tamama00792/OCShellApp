//
//  OCSSwiftViewController.swift
//  OCShellApp
//
//  Created by 徐冰 on 2024/3/11.
//

import UIKit

/// Swift容器页面
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
            ocButton.addTarget(self, action: #selector(self.logObjCUtil(_:)), for: .touchUpInside)
            ocButton.tag = 10000 + index
            view.addSubview(ocButton)
            ocButton.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
            ocButton.center = CGPoint(x: screenWidth / 2, y: screenHeight / 2 - 100 + CGFloat(index) * 100)
        }
    }
    
    @objc func logObjCUtil(_ button:UIButton) {
        switch button.tag {
        case 10000:
            logObjCUtilInsideSameProject()
        case 10001:
            logObjCUtilInsideSamePod()
        case 10002:
            logObjCUtilBetweenPods()
        default:
            break
        }
    }
    
    // 在壳工程内，Swift调用OC需要用到头文件XXX-Bridging-Header.h，并在里面引用需要被调用的OC文件。对应配置位置在【Build Settings】->【Swift Compiler - General】->【Objective-C Bridging Header】。在OC工程内创建Swift文件时会自动生成此配置。
    func logObjCUtilInsideSameProject (){
        let info = "from \(#file)"
        OCShellObjectiveCUtils.logClassMethod(info)
        let util = OCShellObjectiveCUtils()
        util.logInstanceMethod(info)
    }
    
    /*
     * 在同一个pod内，Swift调用OC需要在XXX-umbrella.h头文件里面引用需要被调用的OC文件。
     * 另外还需要配置Defines Module为YES，位置在【Build Settings】->【Packaging】。
     * 当podfile里标注了use_frameworks!时会生成这两个配置。
     */
    func logObjCUtilInsideSamePod (){
        SMOObjeciveCMethodCaller.logObjCUtilInsideSamePod()
        let caller = SMOObjeciveCMethodCaller()
        caller.logObjCUtilInsideSamePod()
    }
    
    /*
     * 在同一个pod内，Swift调用OC需要使用import XXX引用模块，并在该模块的XXX-umbrella.h头文件中引用OC并在里面引用需要被调用的OC文件。
     * 另外还需要配置Defines Module为YES，位置在【Build Settings】->【Packaging】。
     * 当podfile里标注了use_frameworks!时会生成这两个配置。
     */
    func logObjCUtilBetweenPods (){
        SMOObjeciveCMethodCaller.logObjCUtilBetweenPods()
        let caller = SMOObjeciveCMethodCaller()
        caller.logObjCUtilBetweenPods()
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
