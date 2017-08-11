
//
//  HttpController.swift
//  dommmm
//
//  Created by 杰刘 on 2017/6/5.
//  Copyright © 2017年 刘杰. All rights reserved.
//

import UIKit

//代理
protocol HttpProtocol {
    func didRecieveResults(results:Dictionary<String,AnyObject>)
}

class HttpController: NSObject {
    //定义一个代理
    var delegate:HttpProtocol?
    //定义一个方法运过来获取网络数据，接收参数为网址
    func onSearch(urlll:String) {
        //定义一个NSURL
        let urlobj = URL(string:urlll)
        //定义一个NSURLRequest
        let request = URLRequest(url:urlobj!)
        //异步获取数据
        let session = URLSession.shared
        //数据请求
        let dataTask = session.dataTask(with: request,
                                        completionHandler: {(data, response, error) -> Void in
                                            if error != nil{
                                                print(error.debugDescription)
                                            }else{
                                                //数据解析
                                                let jsonResult = try! JSONSerialization.jsonObject(with: data!,
                                                                                                   options: JSONSerialization.ReadingOptions.mutableContainers)
                                                    as! Dictionary<String, AnyObject>
                                                print(jsonResult)
                                                //将数据传回给代理
                                                self.delegate?.didRecieveResults(results: jsonResult)
                                            }
        }) as URLSessionTask
        //使用resume方法启动任务
        dataTask.resume()
    }
    
    func onDownload(downloadurl:String) {
        let urlObj = URL(string:downloadurl)
        
        let requst = URLRequest(url:urlObj!)
        
        let session = URLSession.shared
        
        let downloadTask = session.downloadTask(with: requst, completionHandler: {(loaction:URL?,respone:URLResponse,error:Error?) -> Void in
        
            //输出下载文件原来的存放目录
            print("location:\(String(describing: loaction))")
            
            //location位置转换
            let locationPath = loaction!.path
            //拷贝到用户目录
            let documnets:String = NSHomeDirectory() + "/Documents/1.png"
            //创建文件管理器
            let fileManager = FileManager.default
            try! fileManager.moveItem(atPath: locationPath, toPath: documnets)
            print("new location:\(documnets)")
            
            
        } as! (URL?, URLResponse?, Error?) -> Void)
        //使用resume方法启动任务
        downloadTask.resume()
    }
    
    func onSynchronization(url:String) {
        //创建NSURL对象
        let url:NSURL! = NSURL(string: url)
        //创建请求对象
        let urlRequest = NSURLRequest(url:url as URL)
        //响应对象
        var response:URLResponse?
        
        do{
            //发送请求
            let data:NSData? = try NSURLConnection.sendSynchronousRequest(urlRequest as URLRequest,
                                                                          returning: &response) as NSData
            let str = NSString(data: data! as Data, encoding: String.Encoding.utf8.rawValue)
            print(str)
            
            
        }catch let error as NSError{
            //打印错误消息
            print(error.code)
            print(error.description)
        }
    }
    
    
}
