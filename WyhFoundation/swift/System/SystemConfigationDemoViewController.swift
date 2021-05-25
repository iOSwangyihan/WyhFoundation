//
//  SystemConfigationDemoViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/5/25.
//

import UIKit
import SystemConfiguration
class SystemConfigationDemoViewController: BaseDemoViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navi.title = "SystemConfiguration--demo"
        _ = kSCNetworkFlagsTransientConnection
        _ = kSCNetworkFlagsReachable
        _ = kSCNetworkFlagsIsLocalAddress
        _ = kSCNetworkFlagsIsDirect
        _ = kSCNetworkFlagsInterventionRequired
        _ = kSCNetworkFlagsConnectionRequired
        _ = kSCNetworkFlagsConnectionAutomatic
        _ = kCFErrorDomainSystemConfiguration
        _ = kSCStatusReachabilityUnknown
        _ = kSCStatusMaxLink
        _ = kSCStatusStale
        _ = kSCStatusNoLink
        _ = kSCStatusNoConfigFile
        _ = kSCStatusPrefsBusy
        _ = kSCStatusNoPrefsSession
        _ = kSCStatusNotifierActive
        _ = kSCStatusNoStoreServer
        _ = kSCStatusNoStoreSession
        _ = kSCStatusNeedLock
        _ = kSCStatusLocked
        _ = kSCStatusKeyExists
        _ = kSCStatusNoKey
        _ = kSCStatusAccessError
        _ = kSCStatusInvalidArgument
        _ = kSCStatusFailed
        _ = kSCStatusOK
        _ = SCError()
        // Do any additional setup after loading the view.
        _ = SCCopyLastError()
        let prefer = SCPreferencesContext()
        _ = SCPreferencesContext(version: .bitWidth, info: nil, retain: nil, release: nil, copyDescription: nil)
        _ = prefer.copyDescription
        _ = prefer.info
        _ = prefer.retain
        _ = prefer.release
        _ = prefer.version
        _ = SCNetworkReachabilityFlags.connectionAutomatic
        _ = SCNetworkReachabilityFlags.isWWAN
        _ = SCNetworkReachabilityFlags.isDirect
        _ = SCNetworkReachabilityFlags.isLocalAddress
        _ = SCNetworkReachabilityFlags.connectionOnDemand
        _ = SCNetworkReachabilityFlags.interventionRequired
        _ = SCNetworkReachabilityFlags.connectionOnTraffic
        _ = SCNetworkReachabilityFlags.connectionRequired
        _ = SCNetworkReachabilityFlags.reachable
        _ = SCNetworkReachabilityFlags.transientConnection
        let f : UInt32 = 0
        let f3 : Int32 = 0
        _ = SCErrorString(f3)
        _ = SCPreferencesNotification(rawValue: f)
        
        _ = SCNetworkReachabilityFlags(rawValue: f)
        var s = sockaddr()
        _ = SCNetworkReachabilityCreateWithAddress(nil, &s)
        var falg = SCNetworkReachabilityFlags()
        if let re  = SCNetworkReachabilityCreateWithAddressPair(nil, nil, nil) {
            _ = SCNetworkReachabilityGetFlags(re, &falg)
            _ = SCNetworkReachabilityGetTypeID()
            _ = SCNetworkReachabilitySetCallback(re, nil, nil)
            
            _ = SCNetworkReachabilityScheduleWithRunLoop(re, RunLoop.main.getCFRunLoop(), "" as CFString)
            _ = SCNetworkReachabilityUnscheduleFromRunLoop(re, RunLoop.main.getCFRunLoop(), "" as CFString)
            _ = SCNetworkReachabilitySetDispatchQueue(re, nil)
            _ = SCNetworkReachabilityCallBack.self
        }
        var name : Int8 = 0
        
        let re = SCNetworkReachabilityContext()
        _ = SCNetworkReachabilityContext(version: .bitWidth, info: nil, retain: nil, release: nil, copyDescription: nil)
        _ = re.copyDescription
        _ = re.info
        _ = re.retain
        _ = re.release
        _ = re.version
        _ = SCNetworkReachabilityCreateWithName(nil, &name)
        _ = kSCNetworkConnectionSelectionOptionOnDemandRetry
        _ = kSCNetworkConnectionSelectionOptionOnDemandHostName
        _ = SCNetworkConnectionPPPStatus.waitingForCallBack
        _ = SCNetworkConnectionPPPStatus.authenticating
        _ = SCNetworkConnectionPPPStatus.negotiatingLink
        _ = SCNetworkConnectionPPPStatus.dialOnTraffic
        _ = SCNetworkConnectionPPPStatus.connectingLink
        _ = SCNetworkConnectionPPPStatus.initializing
        _ = SCNetworkConnectionPPPStatus.disconnected
        _ =  SCNetworkConnectionPPPStatus.negotiatingNetwork
        _ = SCNetworkConnectionPPPStatus.connected
        _ = SCNetworkConnectionPPPStatus.terminating
        _ = SCNetworkConnectionPPPStatus.disconnectingLink
        _ = SCNetworkConnectionPPPStatus.holdingLinkOff
        _ = SCNetworkConnectionPPPStatus.suspended
        _ = SCNetworkConnectionPPPStatus.waitingForRedial
        _ = SCDynamicStoreCallBack.self
        _ = kSCNetworkConnectionBytesIn
        _ = kSCNetworkConnectionBytesOut
        _ = kSCNetworkConnectionPacketsIn
        _ = kSCNetworkConnectionPacketsOut
        _ = kSCNetworkConnectionErrorsOut
        _ = kSCNetworkConnectionErrorsIn
        let context = SCDynamicStoreContext()
        let context2 = SCDynamicStoreContext(version: .max, info: nil, retain: nil, release: nil, copyDescription: nil)
        _ = context.copyDescription
        _ = context.info
        _ = context2.retain
        _ = context2.release
        _ = context.version
        _ = kSCNetworkFlagsTransientConnection
        _ = kSCNetworkFlagsReachable
        _ = kSCNetworkFlagsConnectionRequired
        _ = kSCNetworkFlagsConnectionAutomatic
        _ = kSCNetworkFlagsInterventionRequired
        _ = kSCNetworkFlagsIsLocalAddress
        _ = kSCNetworkFlagsIsDirect
        _ = SCNetworkConnectionContext()
        let c = SCNetworkConnectionContext(version: .bitWidth, info: nil, retain: nil, release: nil, copyDescription: nil)
        _ = c.copyDescription
        _ = c.info
        _ = c.retain
        _ = c.release
        _ = c.version
        _ = SCNetworkConnectionStatus.invalid
        _ = SCNetworkConnectionStatus.disconnected
        _ = SCNetworkConnectionStatus.connecting
        _ = SCNetworkConnectionStatus.connected
        _ = SCNetworkConnectionStatus.disconnecting
        overview.text = "SCDynamicStore:\nSCDynamicStore编程接口提供了对运行系统动态存储中的键-值对的访问。动态存储包含当前活动集(有时称为位置)的配置设置的副本和关于当前网络状态的信息。SCDynamicStore编程接口中的函数允许您查找键值对、添加或删除键值对、添加或更改值以及请求通知。注意，这些函数遵循Core Foundation函数名约定。名称中包含“Create”或“Copy”的函数返回的引用必须由CFRelease函数释放。要使用这些函数，必须首先使用scdynamicstorere(_:_:_:_:)函数建立动态存储会话。当您完成会话时，使用CFRelease关闭它。\n\nSCDynamicStoreCallBack:传递对动态存储的更改通知时使用的回调。\n\nSCDynamicStoreContext:\n结构，其中包含用户指定的数据和动态存储会话的回调。\n\nSCDynamicStore:\n使用系统配置守护进程打开的动态存储会话的句柄。\n\nSCNetwork:SCNetwork编程接口包含应用程序可以使用的功能，以确定该应用程序是否可以到达远程主机，并将配置更改通知系统。当由应用程序发送到网络堆栈的数据包可以离开本地计算机时，就认为远程主机是可到达的。注意，可达性并不能保证数据包会被主机实际接收。\nSCNetworkConnectionFlags:\n标志，指示指定的网络节点名或地址是否可达，是否需要连接，以及在建立连接时是否需要某些用户干预。\n\nSCNetworkConfiguration:\nSCNetworkConfiguration编程接口提供对存储的网络配置的访问。这些功能包括提供对系统上支持网络的设备、网络集、网络服务和网络协议的访问。注意，这些函数遵循Core Foundation函数名约定。名称中包含“Create”或“Copy”的函数返回的引用必须由CFRelease函数释放。注意，在使用此编程接口中的函数时，必须调用SCPreferencesCommitChanges(_:)函数，以确保将更改提交到永久存储中。\nSCNetworkInterface:\n对表示网络接口的对象的引用。\n\nSCBondInterface:\n对表示以太网绑定接口的对象的引用。\n\nSCBondStatus:\n对表示以太网绑定接口状态的对象的引用。\n\nSCVLANInterface:\n对表示虚拟LAN (VLAN)接口的对象的引用。\n\nSCNetworkProtocol:\n对表示网络协议的对象的引用。\n\nSCNetworkService:\n对表示网络服务的对象的引用。\n\nSCNetworkSet:\n对表示网络集的对象的引用。\n\nSCNetworkConnection：\nSCNetworkConnection编程接口包含的函数允许应用程序控制系统中定义的面向连接的服务，并获取连接状态信息。注意，这些函数只允许您控制和获取有关现有服务的信息。如果需要创建、更改或删除服务，则应该使用SCNetworkConfiguration编程接口。请注意:目前只支持对PPP业务进行控制。\n\nSCNetworkConnection:\n管理面向连接的服务的句柄。\n\nSCNetworkConnectionCallBack:\n传递状态事件时使用的回调函数类型。\n\nSCNetworkConnectionContext：\n一种结构，包含用户指定的数据和网络连接的回调。\n\nSCNetworkConnectionStatus:\n网络连接的当前状态。这种状态是通用的和高层次的。扩展状态(特定于网络连接类型)也可用于需要附加信息的应用程序。\n\nSCNetworkConnectionPPPStatus:\n与ppp相关的网络连接状态。该状态作为PPP服务扩展信息的一部分返回。注意，将来可能会返回其他状态。因此，您的申请应该准备接收未知的值。\n\nStatistics Dictionary Keys:\n与统计数据字典中的值相关联的键。\n\nSelection Options Dictionary Keys:\n与SCNetworkConnectionCopyUserPreferences(_:_:_:)选择选项字典一起使用的键。\n\nSCNetworkReachability:\nSCNetworkReachability编程接口允许应用程序确定系统当前网络配置的状态和目标主机的可达性。当由应用程序发送到网络堆栈的数据包可以离开本地设备时，就认为远程主机是可到达的。可达性并不保证数据包会被主机实际接收。SCNetworkReachability编程接口支持同步和异步模型。在同步模型中，通过调用SCNetworkReachabilityGetFlags(_:_:)函数来获取可达状态。在异步模型中，您可以在客户端对象的线程的运行循环上调度SCNetworkReachability对象。客户端实现一个回调函数，以便在给定远程主机的可达性状态发生变化时接收通知。注意，这些函数遵循Core Foundation命名约定。名称中包含“Create”或“Copy”的函数返回的引用必须由CFRelease函数释放。有关检测和解释调用这些函数产生的错误的信息，请参见系统配置。\n\nSCNetworkReachability:\n网络地址或名称的句柄。\n\nSCNetworkReachabilityContext:\n结构体，包含用户指定的数据和SCNetworkReachabilitySetCallback(_:_:_:)使用的回调函数。\n\nSCNetworkReachabilityFlags:\n标志，指示网络节点名称或地址的可达性，包括是否需要连接，以及在建立连接时是否需要某些用户干预。\n\nSCPreferences:\nSCPreferences编程接口允许应用程序以受控的方式加载和存储XML配置数据，并向需要知道配置更改的其他应用程序提供必要的通知。要访问配置首选项，必须首先使用SCPreferencesCreate(_:_:_:)函数建立首选项会话。要识别要访问的特定首选项集，可以在prefsID参数中传递一个值。NULL值表示要访问缺省的系统首选项。以\"/\"开头的字符串指定包含要访问的首选项的文件的绝对路径。不以\"/\"开头的字符串指定相对于默认系统首选项目录的文件。当您完成首选项会话时，使用CFRelease函数来释放它。\n\nSCPreferences:\n用于访问系统配置首选项的打开首选项会话的句柄。\n\nSCPreferencesContext:\n包含用户指定的数据和用于访问系统配置首选项的回调的结构。\n\nSCPreferencesCallBack:\n更新或应用首选项时使用的回调函数的类型。\n\nSCPreferencesNotification:\n通知的类型(与SCPreferencesCallBack callback一起使用)。\n\nSystem Configuration:\nSystemConfiguration编程接口提供了一些函数，您可以使用它们来获取和解释由于调用SystemConfiguration框架的函数而生成的状态和错误代码。\n\nStatus and Error Codes:\n由最近的系统配置函数调用生成的状态或错误代码。\n\nError Domain:\n与系统配置框架报告的错误相关的错误域。\n\nSystemConfiguration Enumerations:\nAnonymous\n\nSystemConfiguration Data Types:\nAuthorizationRef:\n指向不透明授权引用结构的指针.此数据类型指向安全服务器用于存储关于授权会话的信息的结构。使用授权服务中描述的函数来创建、访问和释放授权引用。\n\nAccess WiFi Information Entitlement:\n一个布尔值，指示您的应用程序是否可以访问有关连接的Wi-Fi网络的信息。这个键表示您的应用程序是否可以使用CNCopyCurrentNetworkInfo函数来获取关于当前Wi-Fi网络的信息。要把这个授权添加到你的应用中，启用Xcode中的Access WiFi信息功能。"
        exmaple.text = "Creating a Dynamic Store Session:\n传递对动态存储的更改通知时使用的回调。。\n_ = SCDynamicStoreCallBack.self\n\n结构，其中包含用户指定的数据和动态存储会话的回调。\nlet context = SCDynamicStoreContext()\nlet context2 = SCDynamicStoreContext(version: .max, info: nil, retain: nil, release: nil, copyDescription: nil)\n\n用于提供信息字段的描述的回调。\n_ = context.copyDescription\n\n一个C指针，指向用户指定的数据块。\n _ = context.info\n\n用于删除先前为信息字段添加的retain的回调函数。如果此参数不是指向正确原型函数的指针，则该行为未定义。该参数取值为NULL。\n_ = context2.release\n\n用于为信息字段添加保留项的回调。如果此参数不是指向正确原型函数的指针，则该行为未定义。该参数取值为NULL。\n_ = context2.retain\n\n结构类型的版本号作为参数传递给SCDynamicStore创建函数(例如scdynamicstorere(_:_:_:_:)))。这个结构是版本0。\n_ = context.version\n\n指定的节点名或地址可以通过瞬态连接(如PPP)连接到。。\n_ = kSCNetworkFlagsTransientConnection\n\n可以使用当前网络配置访问指定的节点名称或地址。\n_ = kSCNetworkFlagsReachable\n\n可以使用当前网络配置访问指定的节点名或地址，但必须首先建立连接。例如，对于当前不活动但可以处理目标系统的网络通信的拨号连接，将返回此状态。\n_ = kSCNetworkFlagsConnectionRequired\n\n可以使用当前网络配置访问指定的节点名或地址，但必须首先建立连接。任何定向到指定名称或地址的通信流都将启动连接。\n_ = kSCNetworkFlagsConnectionAutomatic\n\n可以使用当前网络配置访问指定的节点名或地址，但必须首先建立连接。此外，还需要某种形式的用户干预来建立此连接，例如提供密码、身份验证令牌等。目前，当有一个流量上的拨号配置(ConnectionAutomatic)，已经尝试连接，以及在自动连接尝试中遇到一些错误(例如，没有拨号音、没有应答、密码错误等)时，将返回此标志。在这种情况下，PPP控制器停止尝试建立连接，直到用户介入。\n_ = kSCNetworkFlagsInterventionRequired\n\n指定的节点名称或地址与当前系统上的网络接口相关联。\n_ = kSCNetworkFlagsIsLocalAddress\n\n到指定节点名或地址的网络流量不经过网关，而是直接路由到系统中的一个接口。\n_ = kSCNetworkFlagsIsDirect\n\n一种结构，包含用户指定的数据和网络连接的回调。\n_ = SCNetworkConnectionContext()\nlet c = SCNetworkConnectionContext(version: .bitWidth, info: nil, retain: nil, release: nil, copyDescription: nil)\n\n用于提供信息字段的描述的回调。\n_ = c.copyDescription\n\n一个C指针，指向用户指定的数据块。\n_ = c.info\n\n用于删除先前为info字段添加的retain的回调。如果此参数不是指向正确原型函数的指针，则该行为未定义。取值可以是NULL。\n_ = c.release\n\n用于为信息字段添加保留项的回调。如果此参数不是指向正确原型函数的指针，则该行为未定义。取值可以是NULL。\n_ = c.retain\n\n结构类型的版本号作为参数传递给SCNetworkConnectionCreateWithServiceID(_:_:_:_:)函数。这个结构是版本0。\n_ = c.version\n\n网络连接指向一个无效的服务。\n_ = SCNetworkConnectionStatus.invalid\n\n网络连接断开。\n_ = SCNetworkConnectionStatus.disconnected\n\n网络连接正在连接。\n_ = SCNetworkConnectionStatus.connecting\n\n网络连接已连接。\n_ = SCNetworkConnectionStatus.connected\n\n网络连接断开。\n _ = SCNetworkConnectionStatus.disconnecting\n\n购买力平价是断开连接。\n_ = SCNetworkConnectionPPPStatus.disconnected\n\n购买力平价是初始化。\n_ = SCNetworkConnectionPPPStatus.initializing\n\nPPP连接较低的连接层(如modem拨号)。\n_ = SCNetworkConnectionPPPStatus.connectingLink\n\nPPP正在等待网络流量自动建立连接。\n_ = SCNetworkConnectionPPPStatus.dialOnTraffic\n\nPPP下层连接，PPP正在协商链路层(LCP协议)\n_ = SCNetworkConnectionPPPStatus.negotiatingLink\n\nPPP是对服务器的验证(PAP、CHAP、MS-CHAP或EAP协议)。\n_ = SCNetworkConnectionPPPStatus.authenticating\n\nPPP正在等待服务器回呼。\n _ = SCNetworkConnectionPPPStatus.waitingForCallBack\n\nPPP现在已经过验证，并与网络层(IPCP或IPv6CP协议)进行协商。\n_ =  SCNetworkConnectionPPPStatus.negotiatingNetwork\n\nPPP现在已经完全连接了至少一个网络层。其他的网络协议可能还在协商中。\n_ = SCNetworkConnectionPPPStatus.connected\n\nPPP网络和链路协议正在终止。\n_ = SCNetworkConnectionPPPStatus.terminating\n\nPPP正在断开较低级别的连接(如modem挂起)。\n_ = SCNetworkConnectionPPPStatus.disconnectingLink\n\nPPP断开，链路暂时处于断开状态。\n_ = SCNetworkConnectionPPPStatus.holdingLinkOff\n\n由于执行了suspend命令，PPP被挂起(例如，V.92 Modem处于保持状态)。\n_ = SCNetworkConnectionPPPStatus.suspended\n\nPPP已经找到一个忙碌的服务器，正在等待重拨。\n_ = SCNetworkConnectionPPPStatus.waitingForRedial\n\n与没有PPP头和尾的任何网络协议进入网络堆栈的字节数相关联的密钥。\n_ = kSCNetworkConnectionBytesIn\n\n与没有PPP头和尾的任何网络协议从网络堆栈流出的字节数相关联的密钥。\n_ = kSCNetworkConnectionBytesOut\n\n与没有PPP头和尾的任何网络协议向上进入网络堆栈的数据包数量相关联的密钥。\n_ = kSCNetworkConnectionPacketsIn\n\n与没有PPP头和尾的任何网络协议从网络堆栈出来的数据包数量相关联的密钥。\n_ = kSCNetworkConnectionPacketsOut\n\n与任何没有PPP头和尾的网络协议进入网络堆栈的错误数量相关的密钥。\n_ = kSCNetworkConnectionErrorsIn\n\n与任何没有PPP头和尾的网络协议从网络堆栈出来的错误数相关的密钥。\n _ = kSCNetworkConnectionErrorsOut\n\n与用于选择“最佳”网络连接的主机名相关联的键。\n_ = kSCNetworkConnectionSelectionOptionOnDemandHostName\n\n与布尔值相关联的键，该值用于指示是否已针对指定的按需主机名发出DNS查询。\n_ = kSCNetworkConnectionSelectionOptionOnDemandRetry\n\n创建对指定网络地址的可达性引用。您可以使用此函数返回的可达性引用来监视目标主机的可达性。\nvar s = sockaddr()\n_ = SCNetworkReachabilityCreateWithAddress(nil, &s)\n\n创建对指定网络地址的可达性引用。您可以使用此函数返回的可达性引用来监视目标主机的可达性。\nlet re  = SCNetworkReachabilityCreateWithAddressPair(nil, nil, nil)\n\n创建对指定网络主机或节点名的可达性引用。您可以使用此函数返回的可达性引用来监视目标主机的可达性。\nvar name : Int8 = 0\n_ = SCNetworkReachabilityCreateWithName(nil, &name)\n\n确定指定的网络目标是否使用当前网络配置可达。\nvar falg = SCNetworkReachabilityFlags()\n_ = SCNetworkReachabilityGetFlags(re, &falg)\n返回所有SCNetworkReachability实例的类型标识符。\n_ = SCNetworkReachabilityGetTypeID()\n\n将客户端分配给指定的目标，当目标的可达性发生变化时，该目标接收回调。\n_ = SCNetworkReachabilitySetCallback(re, nil, nil)\n\n使用指定的运行循环和模式调度指定的网络目标。\n _ = SCNetworkReachabilityScheduleWithRunLoop(re, RunLoop.main.getCFRunLoop(), \"\" as CFString)\n\n从指定的运行循环和模式中取消指定目标的调度。\n_ = SCNetworkReachabilityUnscheduleFromRunLoop(re, RunLoop.main.getCFRunLoop(), \"\" as CFString)\n\n为指定分派队列上的指定目标安排回调。\n_ = SCNetworkReachabilitySetDispatchQueue(re, nil)\n\n当网络地址或名称的可达性发生变化时使用的回调函数类型。\n_ = SCNetworkReachabilityCallBack.self\n\n结构体，包含用户指定的数据和SCNetworkReachabilitySetCallback(_:_:_:)使用的回调函数。\nlet re = SCNetworkReachabilityContext()\n_ = SCNetworkReachabilityContext(version: .bitWidth, info: nil, retain: nil, release: nil, copyDescription: nil)\n\n用于提供信息字段的描述的回调。\n_ = re.copyDescription\n\n一个C指针，指向用户指定的数据块。\nre.info\n\n用于删除先前为信息字段添加的retain的回调函数。如果此参数不是指向正确原型函数的指针，则该行为未定义。取值为NULL。\n_ = re.release\n\n用于为信息字段添加保留项的回调。如果此参数不是指向正确原型函数的指针，则该行为未定义。取值为NULL。\n_ = re.retain\n\n作为参数传递给SCDynamicStore创建函数的结构类型的版本号。这个结构是版本0。\n_ = re.version\n\n指定的节点名或地址可以通过瞬态连接(如PPP)连接到。\n_ = SCNetworkReachabilityFlags.transientConnection\n\n可以使用当前网络配置访问指定的节点名称或地址。\n_ = SCNetworkReachabilityFlags.reachable\n\n可以使用当前网络配置访问指定的节点名或地址，但必须首先建立连接。如果设置了这个标志，通常还会设置kSCNetworkReachabilityFlagsConnectionOnTraffic标志、kSCNetworkReachabilityFlagsConnectionOnDemand标志或kSCNetworkReachabilityFlagsIsWWAN标志来指示所需的连接类型。如果用户必须手动连接，也会设置kSCNetworkReachabilityFlagsInterventionRequired标志。\n_ = SCNetworkReachabilityFlags.connectionRequired\n\n可以使用当前网络配置访问指定的节点名或地址，但必须首先建立连接。任何定向到指定名称或地址的通信流都将启动连接。这个标志以前被命名为kSCNetworkReachabilityFlagsConnectionAutomatic。\n_ = SCNetworkReachabilityFlags.connectionOnTraffic\n\n可以使用当前网络配置访问指定的节点名或地址，但必须首先建立连接。此外，还需要某种形式的用户干预来建立此连接，例如提供密码、身份验证令牌等。目前，只有在有一个流量拨号配置(kSCNetworkReachabilityFlagsConnectionOnTraffic)，已经尝试连接，以及在自动连接尝试期间发生一些错误(如没有拨号音、没有应答、密码错误等)时，才会返回此标志。在这种情况下，PPP控制器停止尝试建立连接，直到用户介入。\n_ = SCNetworkReachabilityFlags.interventionRequired\n\n可以使用当前网络配置访问指定的节点名或地址，但必须首先建立连接。该连接将通过CFSocketStream编程接口“按需”建立(有关这方面的信息，请参阅附加的CFStream Socket)。其他函数不会建立连接。\n_ = SCNetworkReachabilityFlags.connectionOnDemand\n\n指定的节点名称或地址与当前系统上的网络接口相关联。\n_ = SCNetworkReachabilityFlags.isLocalAddress\n\n到指定节点名或地址的网络通信将不经过网关，而是直接路由到系统中的一个接口。\n_ = SCNetworkReachabilityFlags.isDirect\n\n可以通过蜂窝连接(如EDGE或GPRS)访问指定的节点名称或地址。重要的:\n没有这个标志并不一定意味着连接永远不会通过蜂窝网络。如果您需要有效地防止蜂窝网络，请阅读网络概述中的避免常见网络错误。\n_ = SCNetworkReachabilityFlags.isWWAN\n\n可以使用当前网络配置访问指定的节点名或地址，但必须首先建立连接。任何定向到指定名称或地址的通信流都将启动连接。这个标志是connectionOnTraffic的同义词。\n_ = SCNetworkReachabilityFlags.connectionAutomatic\n\nlet f : UInt32 = 0\n_ = SCNetworkReachabilityFlags(rawValue: f)\n\n包含用户指定的数据和用于访问系统配置首选项的回调的结构。\nlet prefer = SCPreferencesContext()\n_ = SCPreferencesContext(version: .bitWidth, info: nil, retain: nil, release: nil, copyDescription: nil)\n\n用于提供信息字段的描述的回调。\n_ = prefer.copyDescription\n\n一个C指针，指向用户指定的数据块。\n_ = prefer.info\n\n用于删除先前为info字段添加的retain的回调。如果此参数不是指向正确原型函数的指针，则该行为未定义。取值可以是NULL。\n _ = prefer.release\n\n用于为信息字段添加保留项的回调。如果此参数不是指向正确原型函数的指针，则该行为未定义。取值可以是NULL。\n_ = prefer.retain\n\n结构类型的版本号作为参数传递给SCPreferencesSetCallback(_:_:_:)。这个结构是版本0。\n_ = prefer.version\n\n通知的类型(与SCPreferencesCallBack callback一起使用)。\n _ = SCPreferencesNotification(rawValue: f)\n\n返回与最近的函数调用相关联的错误或状态码。在返回的对象上调用CFErrorGetCode(_:)函数以获得底层的错误码整数。有关这些代码的描述，请参阅状态和错误代码。有关CFErrorRef对象的更多信息，请参见CFError。\n_ = SCCopyLastError()\n\n返回与最近的函数调用相关联的错误或状态码。\n_ = SCError()\n\n返回描述指定状态码或错误码的字符串。\n_ = SCErrorString(f3)\n\n呼叫成功。\n_ = kSCStatusOK\n\n发生了一个非特定的故障。\n_ = kSCStatusFailed\n\n指定了无效的参数。\n_ = kSCStatusInvalidArgument\n\n权限被拒绝;您必须是根用户才能获得锁。因此，该函数不能创建或访问首选项\n_ = kSCStatusAccessError\n\n没有这样的关键。\n_ = kSCStatusNoKey\n\n键已经定义好了。\n_ = kSCStatusKeyExists\n\n一个锁已经被持有。\n_ = kSCStatusLocked\n\n此操作需要一个锁。\n_ = kSCStatusNeedLock\n\n配置守护进程会话未激活。\n_ = kSCStatusNoStoreSession\n\n配置守护进程不可用或不再可用。\n_ = kSCStatusNoStoreServer\n\n通知程序当前处于激活状态。\n_ = kSCStatusNotifierActive\n\n首选项会话没有激活。\n_ = kSCStatusNoPrefsSession\n\n首选项更新目前正在进行中。\n_ = kSCStatusPrefsBusy\n\n找不到配置文件。\n_ = kSCStatusNoConfigFile\n\n不存在这样的链接。\n_ = kSCStatusNoLink\n\n试图对对象的旧版本进行写操作。\n_ = kSCStatusStale\n\n超过最大链路数。\n_ = kSCStatusMaxLink\n\n无法确定网络可达性。\n _ = kSCStatusReachabilityUnknown\n\n标识Core Foundation错误域的字符串常量。有关错误域的更多信息，请参见CFError。。\n_ = kCFErrorDomainSystemConfiguration\n\n可以使用当前网络配置访问指定的节点名或地址，但必须首先建立连接。任何定向到指定名称或地址的通信流都将启动连接。\n_ = kSCNetworkFlagsConnectionAutomatic\n\n可以使用当前网络配置访问指定的节点名或地址，但必须首先建立连接。例如，对于当前不活动但可以处理目标系统的网络通信的拨号连接，将返回此状态。\n_ = kSCNetworkFlagsConnectionRequired\n\n可以使用当前网络配置访问指定的节点名或地址，但必须首先建立连接。此外，还需要某种形式的用户干预来建立此连接，例如提供密码、身份验证令牌等。目前，当有一个流量上的拨号配置(ConnectionAutomatic)，已经尝试连接，以及在自动连接尝试中遇到一些错误(例如，没有拨号音、没有应答、密码错误等)时，将返回此标志。在这种情况下，PPP控制器停止尝试建立连接，直到用户介入。\n_ = kSCNetworkFlagsInterventionRequired\n\n到指定节点名或地址的网络流量不经过网关，而是直接路由到系统中的一个接口。\n_ = kSCNetworkFlagsIsDirect\n\n指定的节点名称或地址与当前系统上的网络接口相关联。\n_ = kSCNetworkFlagsIsLocalAddress\n\n可以使用当前网络配置访问指定的节点名称或地址。\n_ = kSCNetworkFlagsReachable\n\n指定的节点名或地址可以通过瞬态连接(如PPP)连接到。\n_ = kSCNetworkFlagsTransientConnection\n\n"
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
