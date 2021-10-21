//
//  CoreFoundationViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/10/19.
//




import UIKit
enum CoreFoundationViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS2+\n访问与Foundation框架无缝连接的底层函数、原始数据类型和各种集合类型。"
        case .topics:
            return "Base Utilities--CoreFoundation定义了许多杂项符号，它们要么被许多不同的不透明类型使用，比如CFIndex，要么作为一个整体应用于CoreFoundation，比如kCFCoreFoundationVersionNumber。这些符号被收集在一起并记录在这里。\nByte-Order Utilities--在处理跨平台传输或共享的二进制数据时，需要关注每个平台如何存储数值。平台以大端或小端格式存储值。在大端机器(如PowerPC机器)上，值以最有效的字节存储在内存中;在小端机器(如奔腾机器)上，值首先存储为最低有效字节。如果一台计算机没有正确地转换多字节值，那么以不同格式传输到平台的多字节值就会被错误地解释。\nPreferences Utilities--有几个函数将首选项值作为Core Foundation属性列表对象返回。您可以使用CFGetTypeID(_:)函数来确定值的类型。有关属性列表的更多信息，请参见核心基础的属性列表编程主题。\nSocket Name Server Utilities--名称服务器功能目前在macOS中无法操作。\nCFAllocator--CFAllocator是一个不透明的类型，它为您分配和释放内存。您永远不必为Core Foundation对象直接分配、重新分配或释放内存——您也很少应该这样做。你将CFAllocator对象传递给创建对象的函数;这些函数的名称中嵌入了“Create”，例如CFStringCreateWithPascalString。创建函数使用分配器为它们创建的对象分配内存。\nCFArray--CFArray及其派生的可变类型CFMutableArray管理被称为数组的值的有序集合。CFArray创建静态数组，CFMutableArray创建动态数组。\nCFAttributedString--CFAttributedString的实例管理字符串和应用于字符串中的单个字符或字符范围的相关属性集(例如，字体和字距信息)。在Core Foundation中定义的CFAttributedString提供了基本的容器功能，而更高级别提供了标准属性、它们的值以及涉及这些属性的其他行为的定义。CFAttributedString表示一个不可变的字符串——使用CFMutableAttributedString来创建和管理一个可在创建后更改的带属性字符串。\nCFBag--CFBag及其派生的可变类型CFMutableBag管理被称为bags的值的非顺序集合，其中可以有重复的值。CFBag创建静态包，CFMutableBag创建动态包。\nCFBinaryHeap--CFBinaryHeap实现了一个容器，用于存储使用二进制搜索算法排序的值。所有二进制堆都是可变的;没有单独的不可变的变种。二进制堆可以用作优先级队列。\nCFBitVector--CFBitVector及其派生的可变类型CFMutableBitVector管理位值的有序集合，这些位值要么是0，要么是1。CFBitVector创建静态位向量，CFMutableBitVector创建动态位向量。\nCFBoolean--CFBoolean对象用于包装在Core Foundation属性列表和集合类型中使用的布尔值。\nCFBundle--CFBundle允许您使用称为bundle的文件夹层次结构来组织和定位多种类型的应用程序资源，包括图像、声音、本地化字符串和可执行代码。在macOS中，捆绑包也可以被CFM应用程序用于从Mach-O框架加载和执行函数。您可以使用包来支持多种语言或在多种操作环境中执行应用程序。\nCFCalendar--CFCalendar不透明类型表示一个日历系统。相关的API提供关于日历的信息，并支持日历计算，例如确定给定日历单位的范围和向给定绝对时间添加单位。\nCFCharacterSet--CFCharacterSet对象表示一组符合Unicode的字符。CFString使用CFCharacterSet对象将字符组合在一起进行搜索操作，这样它们就可以在搜索过程中找到任意一组特定的字符。CFCharacterSet和CFMutableCharacterSet这两种不透明类型分别定义了静态字符集和动态字符集的接口。使用这些不透明类型创建的对象被称为字符集对象(如果不会造成混淆，就称为字符集)。\nCFData--CFData及其派生的可变类型CFMutableData提供了对数据对象、字节缓冲区的面向对象包装器的支持。数据对象让简单分配的缓冲区(即没有嵌入指针的数据)具有Core Foundation对象的行为。CFData创建静态数据对象，CFMutableData创建动态数据对象。数据对象通常用于原始数据存储。\nCFDate--CFDate对象存储的日期和时间可以与其他日期和时间进行比较。CFDate对象是不可变的——对于这个不透明类型没有可变的对应对象。\nCFDateFormatter--CFDateFormatter对象格式化CFDate和CFAbsoluteTime对象的文本表示，并将日期和时间的文本表示转换为CFDate和CFAbsoluteTime对象。你可以非常灵活地表示日期和时间，例如“Thu 22 Dec 1994”和“12/22/94”一样可以接受。您可以通过设置格式字符串和cfdatefommatter对象的其他属性来指定如何格式化和解析字符串。\nCFDictionary--CFDictionary及其派生的可变类型CFMutableDictionary管理键-值对的关联。CFDictionary创建静态字典，在第一次创建字典时设置键值对，之后不能修改它们;CFMutableDictionary创建动态字典，您可以随时在其中添加或删除键值对，字典会根据需要自动分配内存。\nCFError--CFError对象封装了比仅使用错误代码或错误字符串更丰富和可扩展的错误信息。CFError对象的核心属性是一个错误域(用字符串表示)、一个特定于域的错误代码和一个包含特定于应用程序信息的“用户信息”字典。错误需要有一个域和该域内的错误代码。一些众所周知的域被定义为对应于Mach、POSIX和OSStatus错误。\nCFFileDescriptor--CFFileDescriptor提供了一个不透明的类型来通过CFRunLoop监视文件描述符的读写活动。\nCFLocale--排序和文本边界确定等Unicode操作可能会受到特定语言或区域的约定的影响。CFLocale对象为语言敏感的操作指定特定于语言或特定于区域的信息。\nCFMachPort--CFMachPort对象是本机Mach端口(mach_port_t)的包装器。Mach端口是macOS内核的本地通信通道。\nCFMutableArray--CFMutableArray管理动态数组。CFArray提供了管理阵列的基本接口。CFMutableArray添加函数来修改数组的内容。\nCFMutableAttributedString--CFMutableAttributedString的实例管理可变字符串和应用于字符串中的单个字符或字符范围的相关属性集(例如，字体和字距信息)。在CoreFoundation中定义的CFAttributedString提供了基本的容器功能，而更高的级别提供了标准属性、它们的值以及涉及这些属性的其他行为的定义。CFMutableAttributedString表示一个可变字符串——使用CFAttributedString创建和管理一个在创建后不能更改的带属性字符串。\nCFMutableBag--CFMutableBag管理动态包。CFBag提供了袋子管理的基本界面。CFMutableBag添加了修改包内容的函数。\nCFMutableBitVector--CFMutableBitVector对象管理动态位向量。CFBitVector提供了管理位向量的基本接口。CFMutableBitVector添加了修改位向量内容的函数。\nCFMutableCharacterSet--CFMutableCharacterSet管理动态字符集。CFCharacterSet提供了管理字符集的基本接口。CFMutableCharacterSet添加了修改字符集内容的函数。\nCFMutableData--CFMutableData管理动态二进制数据。CFData提供了管理二进制数据的基本接口。CFMutableData添加函数来修改二进制数据对象的内容。\nCFMutableDictionary--CFMutableDictionary管理动态字典。CFDictionary提供了管理字典的基本接口。CFMutableDictionary添加函数来修改字典的内容。\nCFMutableSet--CFMutableSet管理动态集。CFSet提供了管理集的基本接口。CFMutableSet添加函数来修改集合的内容。\nCFMutableString--CFMutableString管理动态字符串。CFString提供了管理字符串的基本接口。CFMutableString添加函数来修改字符串的内容。\nCFNotificationCenter--CFNotificationCenter对象提供了一种方法，通过这种方法，您可以向任意数量的接收者或观察者发送消息或通知，而无需了解接收者的任何信息。通知消息由一个通知名称(CFString)、一个指针值(标识发送通知的对象)和一个可选字典(包含关于特定通知的附加信息)组成。\nCFNull--CFNull opaque类型定义了一个唯一的对象，用于表示集合对象中的空值(不允许null值)。CFNull对象既不创建也不销毁。相反，定义了一个CFNull常量对象—kcfnull—并在需要空值的地方使用它。\nCFNumber--CFNumber封装了C标量(数字)类型。它提供了作为任何基本C类型设置和访问值的函数。它还提供了一个比较函数来确定两个CFNumber对象的顺序。CFNumber对象用于包装在Core Foundation属性列表和集合中使用的数值。\nCFNumberFormatter--CFNumberFormatter对象格式化CFNumber对象的文本表示，并将数字的文本表示转换为CFNumber对象。其表示形式包括整数、浮点数和双精度数;可以将浮点数和双精度数格式化为指定的小数位置。您可以通过设置CFNumberFormatter对象的格式字符串和其他属性来指定如何格式化和解析字符串。\nCFPlugIn--CFPlugIn为应用程序扩展提供了一个标准体系结构。使用CFPlugIn，您可以将应用程序设计为一个宿主框架，该框架使用一组称为插件的可执行代码模块来提供某些定义良好的功能区域。这种方法允许第三方开发人员向您的应用程序添加特性，而不需要访问您的源代码。您还可以将多个平台的插件捆绑在一起，并让CFPlugIn在运行时透明地加载适当的插件。您可以使用CFPlugIn向应用程序添加插件功能，或者为应用程序编写插件。\nCFPlugInInstance--CFPlugInInstance弃用。请使用CFPlugIn定义的函数。\nCFPropertyList--CFPropertyList提供了将属性列表对象与几种序列化格式(如XML)进行转换的函数。表示CFPropertyList对象的CFPropertyList类型是属性列表对象的抽象类型。根据用于创建属性列表的XML数据的内容，CFPropertyListRef可以是任何属性列表对象:CFData、CFString、CFArray、CFDictionary、CFDate、CFBoolean和CFNumber。注意，如果使用属性列表生成XML，那么属性列表中任何字典的键都必须是CFString对象。\nCFReadStream--CFReadStream提供了一个接口，用于同步或异步地读取字节流。您可以创建从内存块、文件或通用套接字读取字节的流。在读取之前，需要使用CFReadStreamOpen(_:)打开所有流。\nCFRunLoop--CFRunLoop对象监视任务的输入源，并在它们准备好处理时分派控制。输入源的例子可能包括用户输入设备、网络连接、周期性或延时事件以及异步回调。\nCFRunLoopObserver--CFRunLoopObserver提供了在运行的运行循环的不同点接收回调的通用方法。与来源,这火异步事件发生时,计时器,这火当一个特定的时间的流逝,观察家火内的特殊位置上的执行运行循环,如前处理来源或运行循环之前睡觉,等待一个事件发生。观察者可以是一次性事件，也可以是在运行循环的每次循环中重复的事件。\nCFRunLoopSource--CFRunLoopSource对象是一个输入源的抽象，可以放到运行循环中。输入源通常生成异步事件，例如到达网络端口的消息或用户执行的操作。\nCFRunLoopTimer--CFRunLoopTimer对象表示一个专门的运行循环源，它在未来的预设时间触发。计时器可以只触发一次或以固定的时间间隔重复触发。重复计时器也可以手动调整下一次发射时间。\nCFSet--CFSet及其派生的可变类型CFMutableSet提供了对集合的数学概念的支持。集合，无论是在数学意义上还是在CFSet的实现中，都是不同元素的无序集合。CFSet创建静态集，CFMutableSet创建动态集。\nCFSocket--CFSocket是用BSD套接字实现的通信通道。\nCFString--CFString提供了一套高效的字符串操作和字符串转换函数。它提供了无缝的Unicode支持，并促进了Cocoa和基于c的程序之间的数据共享。CFString对象是不可变的——使用CFMutableString创建和管理一个可以在创建后更改的字符串。\nCFStringTokenizer--CFStringTokenizer允许您以一种语言中立的方式将字符串标记为单词、句子或段落。它支持像日语和汉语这样不使用空格分隔单词的语言，也支持分解德语复合词。你可以获得令牌的拉丁文转录。它还提供了语言识别API。\nCFTimeZone--CFTimeZone定义时区对象的行为。时区对象代表地缘政治区域。因此，这些对象有这些区域的名称。时区对象还表示格林尼治标准时间(GMT)和缩写(如太平洋标准时间PST)的正负时间差。\nCFTree--您可以使用CFTree创建表示信息分层组织的树状结构。在这样的结构中，每个树节点都有一个父树(根树除外，根树没有父树)，并且可以有多个子树。结构中的每个CFTree对象都有一个与之相关联的上下文;这个上下文包括一些程序定义的数据以及对该数据进行操作的回调。程序定义的数据通常用作确定CFTree对象在结构中的位置的基础。所有CFTree对象都是可变的。\nCFType--所有其他Core Foundation不透明类型都派生自CFType。任何派生的不透明类型都可以使用为CFType定义的函数、回调、数据类型和常量。因此，CFType函数被称为“多态函数”。您可以使用CFType函数来保留和释放对象，比较和检查对象，获取对象和不透明类型的描述，以及获取对象分配器。\nCFURL--CFURL不透明类型提供了创建、解析和解引用URL字符串的工具。CFURL对于需要使用url访问资源(包括本地文件)的应用程序很有用。\nCFUUID--插件使用CFUUID对象来唯一地标识类型、接口和工厂。在创建新类型时，主机开发人员必须生成uuid来标识类型及其接口和工厂。\nCFWriteStream--CFWriteStream提供了一个用于同步或异步写入字节流的接口。您可以创建将字节写入内存块、文件或通用套接字的流。在写入之前，需要使用CFWriteStreamOpen(_:)打开所有流。\nCFFileSecurity--将文件系统对象的安全信息封装在Core Foundation对象中。\nCFURLEnumerator--对CFURLEnumerator对象的引用。"
        case .demo:
            return "Click here to example"
        }
    }
}
class CoreFoundationViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [CoreFoundationViewControllerType.overview, CoreFoundationViewControllerType.topics, CoreFoundationViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? CoreFoundationViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? CoreFoundationViewControllerType ?? CoreFoundationViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = CoreFoundationDemoViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
                // Fallback on earlier versions
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

