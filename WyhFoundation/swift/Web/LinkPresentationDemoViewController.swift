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
    var linkView : LPLinkView?
    var error : LPError?
    
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
            
            linkView = LPLinkView(url: url)
            
            if let data = currentData {
                linkView = LPLinkView(metadata: data)
                linkView?.metadata = data
            }
            
        }
        self.error = LPError(.metadataFetchTimedOut, userInfo: [:])
        _ = self.error?.errorCode
        _ = self.error?.errorUserInfo
        _ = self.error?.localizedDescription
        _ = LPError.errorDomain
        _  = LPErrorDomain
        _ = LPError.metadataFetchCancelled
        _ = LPError.metadataFetchFailed
        _ = LPError.metadataFetchTimedOut
        _ = LPError.unknown
        _ = LPError.Code.metadataFetchCancelled
        _ = LPError.Code.metadataFetchFailed
        _ = LPError.Code.metadataFetchTimedOut
        _ = LPError.Code.unknown
        
        _ = self.error != LPError(.metadataFetchCancelled)
        provider.cancel()
        
        overview.text = "LPMetadataProvider:\n使用LPMetadataProvider获取URL的元数据，包括它的标题、图标和图像或视频链接。产生的LPLinkMetadata实例上的所有属性都是可选的\n注意:\n要使macOS客户端能够为远程url获取元数据，请添加com.apple.security.network.client授权。\n从URL获取链接元数据\n对于每个元数据请求，创建一个LPMetadataProvider实例，并调用startFetchingMetadata(For:completionHandler:)\n在完成处理程序中，检查错误。如果您的用户没有网络连接，获取可能会失败。如果服务器没有响应或太慢，获取可能会超时。或者，应用程序可能取消请求，或者出现未知错误。\n否则，您可以随意使用元数据，例如，填充表格视图单元格的标题\n\nLPLinkMetadata:\n使用LPLinkMetadata来存储关于URL的元数据，包括它的标题、图标、图像和视频。\n使用LPMetadataProvider获取元数据。对于远程url，在本地缓存元数据，以避免每次呈现它时从互联网上获取它的数据和性能成本。\nLPLinkMetadata使用NSSecureCoding进行序列化。\n对于本地文件url，如果可能的话，QuickLook thumbnailisapi将为文件检索一个具有代表性的缩略图。\n假设你的应用程序已经有一个链接数据库，其中的标题和图像没有被LPMetadataProvider获取。你不必为了加速股票表或呈现富链接而从互联网上获取新的元数据。相反，您可以自己填写LPLinkMetadata的字段\n创建一个LPLinkMetadata对象，至少填写originalURL和url字段，再加上您拥有的任何其他信息。\n对于共享url的现有应用程序，共享表会自动显示链接的预览。在通过网络获取链接的元数据时，预览首先在基URL旁边显示一个占位符链接图标。一旦链接的图标和标题可用，预览就会更新。如果您已经有一个用于URL的LPLinkMetadata对象，那么将它传递到共享表以立即显示预览，而不需要通过网络获取数据。在activityViewControllerLinkMetadata(_:)的实现中，返回元数据对象。\n如果用户选择与Messages共享，则相同的元数据将直接传递，从而提供平滑无缝的体验，无需不必要的加载。\n\nLPLinkView:\n基于其可用元数据提供一个链接。使用它可以以熟悉和一致的风格显示链接的标题和图标、相关图像、内联音频、视频回放和地图\n要在应用程序中呈现一个富链接，创建一个LPLinkView，将一个LPLinkMetadata实例传递给它的初始化器。然后将LPLinkView添加到视图中。例如，要在表视图中显示链接，在填充每个单元格时添加一个LPLinkView实例作为子视图\n\nLPError:\n由LinkPresentation框架返回的错误"
        exmaple.text = "var provider = LPMetadataProvider()\n\n一个布尔值，指示是否下载由元数据指定的子资源,子资源包括图标、图像或视频。当设置为false时，返回的LPLinkMetadata对象只包含由传递给startFetchingMetadata(for:completionHandler:)的url标识的主资源检索的元数据。缺省值为true。\nprovider.shouldFetchSubresources = true\n\n如果请求尚未完成，则在此之后请求将自动失败,默认的超时时间为30秒。如果元数据获取所花费的时间超过了超时时间，则会调用完成处理程序，错误代码为LPError.Code.metadataFetchTimedOut。。\nprovider.timeout = 20\n\n获取给定URL的元数据。每个LPMetadataProvider实例调用此方法一次。如果试图在单个LPMetadataProvider实例上多次获取元数据，则会抛出错误,完成处理程序在后台队列中执行。将任何必要的UI更新发送回主队列。当完成处理程序返回时，它将删除结果LPLinkMetadata中返回的任何文件url。\nif let url = URL(string: \"https://www.baidu.com\") {\nprovider.startFetchingMetadata(for: url) { (data, error) in\nprint(\"data is \\(String(describing: data)) error is \\(String(describing: error))\")\n}\n}\n\n取消元数据请求,如果请求尚未完成，该方法将调用带有错误代码LPError.Code.metadataFetchCancelled的完成处理程序。。\nprovider.cancel()\n\nvar currentData : LPLinkMetadata?\n\n元数据请求的原始URL。\ncurrentData?.originalURL = url\n\n返回元数据的URL，考虑到服务器端重定向。返回元数据的URL可能与您发送元数据请求的原始URL不同。如果服务器重定向请求，例如，当资源已经移动时，或当原始URL是域别名时，就会发生这种情况。\ncurrentData?.url = currentData?.originalURL\n\nURL的一个代表标题\ncurrentData?.title = \"百度数据\"\n\n检索与URL的代表图像对应的数据的对象。\ncurrentData?.imageProvider = .init()\n\n检索与URL的代表图标对应的数据的对象。\ncurrentData?.iconProvider = .init()\n\n一个远程URL对应的代表视频的URL\ncurrentData?.remoteVideoURL = url\n\n检索URL对应于一个代表性视频的数据的对象。\ncurrentData?.videoProvider = .init()\n\nvar linkView : LPLinkView?\n\n初始化不含给定URL元数据的占位符链接视图\nlinkView = LPLinkView(url: url)\n\n使用指定的元数据初始化链接视图。\nif let data = currentData {\nlinkView = LPLinkView(metadata: data)\n\n用来生成丰富表示的元数据\nlinkView?.metadata = data}\n\nvar error : LPError?\nself.error = LPError(.metadataFetchTimedOut, userInfo: [:])\n\n错误代码。\n_ = self.error?.errorCode\n\n有关错误的信息。\n_ = self.error?.errorUserInfo\n\n一个本地化的、人类可读的错误解释。\n_ = self.error?.localizedDescription\n\n错误的域。\n_ = LPError.errorDomain\n\n链接表示错误的域。\n_  = LPErrorDomain\n\n指示客户端取消元数据获取的错误\n_ = LPError.metadataFetchCancelled\n_ = LPError.Code.metadataFetchCancelled\n\n指示元数据获取失败的错误。\n_ = LPError.metadataFetchFailed\n_ = LPError.Code.metadataFetchFailed\n\n指示元数据获取花费的时间超过允许的时间的错误\n_ = LPError.metadataFetchTimedOut\n_ = LPError.Code.metadataFetchTimedOut\n\n一个未知的错误\n_ = LPError.unknown\n_ = LPError.Code.unknown\n\n返回一个布尔值，指示两个错误值是否不相等\n_ = self.error != LPError(.metadataFetchCancelled)}"
        
        if let linkv = linkView {
            backSc.addSubview(linkv)
            exmaple.snp.remakeConstraints { (m) in
                m.top.equalTo(overview.snp.bottom)
                m.left.right.equalTo(overview)
            }
            
            linkv.snp.makeConstraints { (m) in
                m.top.equalTo(exmaple.snp.bottom)
                m.left.right.equalTo(overview)
                m.height.equalTo(100)
                m.bottom.equalToSuperview()
            }
        }
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
