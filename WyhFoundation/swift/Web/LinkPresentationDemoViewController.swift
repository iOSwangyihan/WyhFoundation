//
//  LinkPresentationDemoViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/5/20.
//

import UIKit
import LinkPresentation
@available(iOS 13.0, *)
class LinkPresentationDemoViewController: BaseDemoViewController {
    var provider = LPMetadataProvider()
    var currentData : LPLinkMetadata?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navi.title = "LinkPresentation--demo"
        // Do any additional setup after loading the view.
        provider.shouldFetchSubresources = true
        provider.timeout = 20
        if let url = URL(string: "https://www.baidu.com") {
            provider.startFetchingMetadata(for: url) { (data, error) in
                self.currentData = data
                print("data is \(String(describing: data)) error is \(String(describing: error))")
            }
            
            currentData?.originalURL = url
            currentData?.url = currentData?.originalURL
            currentData?.title = "百度数据"
            currentData?.imageProvider = .init()
            currentData?.iconProvider = .init()
            currentData?.remoteVideoURL = url
            currentData?.videoProvider = .init()
        }
        
        provider.cancel()
        
        overview.text = "LPMetadataProvider:\n使用LPMetadataProvider获取URL的元数据，包括它的标题、图标和图像或视频链接。产生的LPLinkMetadata实例上的所有属性都是可选的\n注意:\n要使macOS客户端能够为远程url获取元数据，请添加com.apple.security.network.client授权。\n从URL获取链接元数据\n对于每个元数据请求，创建一个LPMetadataProvider实例，并调用startFetchingMetadata(For:completionHandler:)\n在完成处理程序中，检查错误。如果您的用户没有网络连接，获取可能会失败。如果服务器没有响应或太慢，获取可能会超时。或者，应用程序可能取消请求，或者出现未知错误。\n否则，您可以随意使用元数据，例如，填充表格视图单元格的标题\nLPLinkMetadata:\n使用LPLinkMetadata来存储关于URL的元数据，包括它的标题、图标、图像和视频。\n使用LPMetadataProvider获取元数据。对于远程url，在本地缓存元数据，以避免每次呈现它时从互联网上获取它的数据和性能成本。LPLinkMetadata使用NSSecureCoding进行序列化。\n对于本地文件url，如果可能的话，QuickLook thumbnailisapi将为文件检索一个具有代表性的缩略图。\n假设你的应用程序已经有一个链接数据库，其中的标题和图像没有被LPMetadataProvider获取。你不必为了加速股票表或呈现富链接而从互联网上获取新的元数据。相反，您可以自己填写LPLinkMetadata的字段\n创建一个LPLinkMetadata对象，至少填写originalURL和url字段，再加上您拥有的任何其他信息。\n对于共享url的现有应用程序，共享表会自动显示链接的预览。在通过网络获取链接的元数据时，预览首先在基URL旁边显示一个占位符链接图标。一旦链接的图标和标题可用，预览就会更新。如果您已经有一个用于URL的LPLinkMetadata对象，那么将它传递到共享表以立即显示预览，而不需要通过网络获取数据。在activityViewControllerLinkMetadata(_:)的实现中，返回元数据对象。\n如果用户选择与Messages共享，则相同的元数据将直接传递，从而提供平滑无缝的体验，无需不必要的加载。"
        exmaple.text = "var provider = LPMetadataProvider()\nprovider.shouldFetchSubresources = true\nprovider.timeout = 20\nif let url = URL(string: \"https://www.baidu.com\") {\nprovider.startFetchingMetadata(for: url) { (data, error) in\nprint(\"data is \\(String(describing: data)) error is \\(String(describing: error))\")\n}\n}\nprovider.cancel()\n\nvar currentData : LPLinkMetadata?\ncurrentData?.originalURL = url\ncurrentData?.url = currentData?.originalURL\ncurrentData?.title = \"百度数据\"\ncurrentData?.imageProvider = .init()\ncurrentData?.iconProvider = .init()\ncurrentData?.remoteVideoURL = url\ncurrentData?.videoProvider = .init()"
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
