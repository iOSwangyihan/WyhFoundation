//
//  UniformTypeIdentifiersDemoViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/5/21.
//

import UIKit
import UniformTypeIdentifiers
class UniformTypeIdentifiersDemoViewController: BaseDemoViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navi.title = "UniformTypeIdentifiers--demo"
        
        if #available(iOS 14.0, *) {
            _ = UTType.sourceCode
            _ = UTType.arReferenceObject
            _ = UTType.sceneKitScene
            _ = UTType.realityFile
            _ = UTType.usdz
            _ = UTType.usd
            _ = UTType.threeDContent
            _ = UTType.font
            _ = UTType.emailMessage
            _ = UTType.toDoItem
            _ = UTType.calendarEvent
            _ = UTType.contact
            _ = UTType.message
            _ = UTType.database
            _ = UTType.presentation
            _ = UTType.spreadsheet
            _ = UTType.internetShortcut
            _ = UTType.internetLocation
            _ = UTType.webArchive
            _ = UTType.html
            _ = UTType.x509Certificate
            _ = UTType.pkcs12
            _ = UTType.vCard
            _ = UTType.binaryPropertyList
            _ = UTType.xmlPropertyList
            _ = UTType.propertyList
            _ = UTType.json
            _ = UTType.yaml
            _ = UTType.xml
            _ = UTType.rtf
            _ = UTType.utf8TabSeparatedText
            _ = UTType.tabSeparatedText
            _ = UTType.commaSeparatedText
            _ = UTType.delimitedText
            _ = UTType.utf16ExternalPlainText
            _ = UTType.utf16PlainText
            _ = UTType.utf8PlainText
            _ = UTType.plainText
            _ = UTType.text
            _ = UTType.bz2
            _ = UTType.gzip
            _ = UTType.zip
            _ = UTType.archive
            _ = UTType.epub
          _ = UTType.audiovisualContent
            _ = UTType.flatRTFD
            _ = UTType.movie
            _ = UTType.video
            _ = UTType.audio
            _ = UTType.quickTimeMovie
            _ = UTType.mpeg
            _ = UTType.mpeg2Video
            _ = UTType.mpeg2TransportStream
            _ = UTType.mp3
            _ = UTType.mpeg4Movie
            _ = UTType.mpeg4Audio
            _ = UTType.appleProtectedMPEG4Video
            _ = UTType.appleProtectedMPEG4Audio
            _ = UTType.avi
            _ = UTType.aiff
            _ = UTType.wav
            _ = UTType.midi
            _ = UTType.playlist
            _ = UTType.m3uPlaylist
            _ = UTType.image
            _ = UTType.jpeg
            _ = UTType.png
            _ = UTType.icns
            _ = UTType.gif
            _ = UTType.tiff
            _ = UTType.bmp
            _ = UTType.ico
            _ = UTType.svg
            _ = UTType.rawImage
            _ = UTType.heic
            _ = UTType.heif
            _ = UTType.webP
            _ = UTType.livePhoto
            _ = UTType.pdf
            _ = UTType.rtfd
        } else {
            // Fallback on earlier versions
        }
        
        overview.text = "Defining File and Data Types for Your App:\n声明统一类型标识符，以支持您的应用程序的专有数据格式\n应用程序可以添加新的类型，以加载、保存或传输具有专有数据格式的文件\n首先在应用的Info中声明导出或导入类型。plist文件。为每个类型标识并选择一个唯一标识符。为导出类型创建新的标识符，或为导入类型使用现有标识符。然后定义与系统声明类型的一致性，并列出任何相关的文件扩展名或MIME类型\n定义类型时，需要将其定义为导出或导入类型;这分别指示你的应用程序是类型的来源还是支持在其他地方定义的类型\n当应用程序是该类型的规范信息源时，定义一个导出类型。例如，一个应用程序使用它自己的私有文档格式应该声明它为导出类型\n如果你的应用使用了一个标准类型，不要在你的应用包中重新声明它。但是，如果你的应用程序使用了另一个应用程序定义的类型，或者是系统类型中没有声明的专有文件格式，你就需要将它定义为导入类型。当从另一个应用中导入类型时，不要声明你自己的标识符;而是使用与原始类型相同的类型标识符\n你为应用创建的标识符必须是唯一的。首先使用以com.companyName开头的反向dns格式，以确保惟一性。虽然系统可以支持具有相同规范的不同类型标识符字符串，但反过来就不正确了。标识符只能包含字母数字字符(a-z、a-z、0-9)、连字符(-)、点(.)。例如，你可以使用com.company.greatAppDocument或com.company.greatApp-document作为Info中的UTTypeIdentifier字符串。plist文件。\n不要使用public或com。Apple作为你应用类型的前缀。系统为公共域或标准类型保留公共类型。前缀dyn保留给系统在没有其他类型可用时动态生成的类型，而前缀com。apple为apple声明的类型保留。\n类型声明可以包含类型符合的类型标识符列表\n例如，如果你的应用程序使用一种私有文件格式，并且该格式基于json，那么使用public。Info中的UTTypeConformsTo字符串中的json。plist文件\n在为文档定义类型时，确保它符合public。如果你的类型不符合public. data或com.apple.package，以确保它可以在Finder或Files应用程序中表示。数据或com.apple。包，系统无法判断磁盘上的项是否具有该类型\n如果您的类型是文档，请确保它符合public。内容，直接或通过符合已经符合public.content的类型。这允许用户通过AirDrop分享你的类型\n您还可以将一致性添加到函数类型，如公共类型。数据库或public.spreadsheet。选择要遵循的最具体的子类型。这些帮助系统确定如何在Spotlight、QuickLook和用户界面的其他部分中最好地显示您的类型的文件\n如果你指定了一个非公共类型的一致性，请确保该类型也在你的bundle中声明。\n除了声明标识符之外，该类型还可以定义一个用户可读的字符串来描述该类型。说明可以进行本地化。例如，你可以使用GreatApp Document作为Info中的UTTypeDescription字符串。plist文件\n在Info中添加UTTypeTagSpecification字典。plist文件来定义您的类型的文件扩展名或MIME类型。例如，将字符串greatappdoc和greatapp添加到一个数组中，并使用公钥将其放入UTTypeTagSpecification字典中。文件名-扩展名，以支持两者作为您的类型的文件扩展名。\n下面的示例显示了添加到Info的导出示例类型。plist文件:\n<key>UTExportedTypeDeclarations</key>\n<array>\n<dict>\n<key>UTTypeIdentifier</key>\n<string>com.company.greatApp-document</string>\n<key>UTTypeConformsTo</key>\n<array>\n<string>public.json</string>\n</array>\n<key>UTTypeDescription</key>\n<string>GreatApp Document</string>\n<key>UTTypeTagSpecification</key>\n<dict>\n<key>public.filename-extension</key>\n<array>\n<string>greatappdoc</string>\n<string>greatapp</string>\n</array>\n</dict>\n</dict>\n</array>\n下表列出了类型声明中使用的可用属性键\nUTExportedTypeDeclarations--数组的字典--你的应用程序拥有的标识符的导出类型声明数组\nUTImportedTypeDeclarations--数组的字典--一组导入的类型声明，通常是由另一个公司或组织声明的类型\nUTTypeIdentifier--字符串--声明类型的标识符。这是类型声明的必需键\nUTTypeTagSpecification--字典--定义一个或多个等效类型标识符的字典。\nUTTypeConformsTo--字符串数组--此标识符符合的类型\nUTTypeDescription--字符串--这种类型的用户可见的描述。您可以通过在InfoPlist中包含该字符串来本地化该字符串。字符串文件\nUTTypeReferenceURL--字符串--描述此类型的引用文档的URL。\n如果类型的导出声明和导入声明同时存在，则导出声明优先于导入声明\n\nUTType:\n一种结构，表示要加载、发送或接收的数据类型\nUTType结构描述数据的类型信息。类型有一个唯一的标识符，并分别提供使用preferredFilenameExtension和preferredMIMEType查找首选文件名扩展名或MIME类型的方法。\n系统包含许多常见类型的静态声明，您可以通过标识符、文件名扩展名或MIME类型查找这些声明。\nUTType结构可以提供与类型相关的附加信息。附加信息的示例包括本地化的面向用户的描述、标识关于类型的技术文档的参考URL或类型的版本号。您还可以通过它们的一致性来查找类型，以获得与您的用例相关的类型或类型列表\n在应用的Info.plist中定义自己的类型。关于如何定义自己的类型，请参见为你的应用定义文件和数据类型。\nSystem Declared Types:\n使用内置功能来标识公共资源类型\n统一类型标识符声明要从其他应用程序加载、保存或打开的资源的公共类型。声明的类型包括在定义自己的专有数据类型时要引用的基类型。\nAudio Video Types,Image Types,Common Application Types,Compressed File Archive Types,Generic Text File Types,Common Data Interchange Formats,Internet Specific File Types,General Application Types,3D Content Interchange Types,Apple 3D Content,Common Programming Language Source Files,Apple System Types"
        exmaple.text = "System Declared Types:\n\nAudio Video Types:\n一种基类型，表示包含视频内容的数据，视频内容可能包括音频，也可能不包括音频。此类型的标识符是public.audiovisual-content。该类型符合uttypcontent和UTTypeData。\n _ = UTType.audiovisualContent\n\n一种基本类型，表示可能同时包含视频和音频的媒体格式。这种类型对应于用户所标注的“电影”。该类型的标识符是public.movie。这种类型符合UTTypeAudiovisualContent。\n_ = UTType.movie\n\n表示不包含音频的视频的类型。该类型的标识符是public.video。该类型符合UTTypeMovie。\n_ = UTType.video\n\n表示不包含视频的音频的类型。这种类型的标识符是public.audio。这种类型符合UTTypeAudiovisualContent。\n_ = UTType.audio\n\n表示QuickTime影片的类型这种类型的标识符是com.apple.quicktime-movie。该类型符合UTTypeMovie。\n_ = UTType.quickTimeMovie\n\n表示MPEG-1或MPEG-2电影的类型此类型的标识符是public.mpeg。该类型符合UTTypeMovie。\n_ = UTType.mpeg\n\n表示MPEG-2视频的类型该类型的标识符是public.mpeg-2-video。符合UTTypeVideo。\n_ = UTType.mpeg2Video\n\n以MPEG-2传输流电影格式表示数据的类型这种类型的标识符是public.mpeg-2-transport-stream。该类型符合UTTypeMovie\n_ = UTType.mpeg2TransportStream\n\n一种表示MP3音频的类型此类型的标识符是public.mp3。该类型符合UTTypeAudio。\n_ = UTType.mp3\n\n表示MPEG-4电影的类型该类型的标识符是public.mpeg-4。该类型符合UTTypeMovie。\n_ = UTType.mpeg4Movie\n\n表示MPEG-4音频层文件的类型。这种类型的标识符是public.mpeg-4-audio。该类型符合UTTypeMPEG和UTTypeAudio。\n _ = UTType.mpeg4Audio\n\n一种以苹果保护的MPEG-4格式表示数据的类型这种类型的标识符是com.apple. protectedmpeg -4-video。此类型符合由com.apple标识的基类型。m4v-video，它又符合UTTypeMPEG4Movie\n_ = UTType.appleProtectedMPEG4Video\n\n一种以apple保护的MPEG4格式表示数据的类型,这种类型的标识符是com.apple. protectedmpeg -4-audio。该类型符合UTTypeAudio。\n_ = UTType.appleProtectedMPEG4Audio\n\n一种以AVI电影格式表示数据的类型。该类型的标识符是public.avi。该类型符合UTTypeMovie。\n _ = UTType.avi\n\n一种以AIFF音频格式表示数据的类型。这种类型的标识符是public.aiff-audio。此类型符合由public标识的基类型。aifc-audio，这反过来符合utttypeaudio。\n_ = UTType.aiff\n\n一种以微软波形音频文件格式表示数据的类型,这种类型的标识符是com.microsoft.waveform-audio。该类型符合UTTypeAudio\n_ = UTType.wav\n\n一种以MIDI音频格式表示数据的类型。这种类型的标识符是public.midi-audio。该类型符合UTTypeAudio。\n _ = UTType.midi\n\n表示播放列表的基类型。此类型的标识符是public.playlist。\n_ = UTType.playlist\n\n表示M3U或M3U8播放列表的类型。这种类型的标识符是public.m3u-playlist。该类型符合UTTypeText和UTTypePlaylist。\n _ = UTType.m3uPlaylist\n\nImage Types:\n表示图像数据的基类型。此类型的标识符是public.image。\n该类型符合UTTypeData和uttypcontent\n_ = UTType.image\n\n表示JPEG图像的类型。此类型的标识符是public.jpeg。该类型符合UTTypeImage。\n_ = UTType.jpeg\n\n一种表示PNG图像的类型。此类型的标识符是public.png。该类型符合UTTypeImage。\n_ = UTType.png\n\n表示苹果图标数据的类型,这种类型的标识符是com.apple.icns。该类型符合UTTypeImage。\n_ = UTType.icns\n\n表示GIF图像的类型。这种类型的标识符是com.compuserve.gif。该类型符合UTTypeImage。\n_ = UTType.gif\n\n表示TIFF图像的类型,此类型的标识符是public.tiff。该类型符合UTTypeImage。\n _ = UTType.tiff\n\n表示Windows位图图像的类型。此类型的标识符是com.microsoft.bmp。该类型符合UTTypeImage\n _ = UTType.bmp\n\n表示Windows图标数据的类型。此类型的标识符是com.microsoft.ico。该类型符合UTTypeImage。\n_ = UTType.ico\n\n表示可缩放矢量图形(SVG)图像的类型。此类型的标识符是public.svg-image。该类型符合UTTypeImage。\n_ = UTType.svg\n\n表示数字摄影中使用的原始图像格式的基本类型,该类型的标识符是public.camera-raw-image。该类型符合UTTypeImage。\n_ = UTType.rawImage\n\n一种表示高效图像编码图像的类型。该类型的标识符是public.heic。此类型符合由public标识的基类型。heif-standard，这又符合UTTypeImage。\n_ = UTType.heic\n\n一种表示高效图像文件格式图像的类型,该类型的标识符是public.heif。此类型符合由public标识的基类型。heif-standard，这又符合UTTypeImage。\n_ = UTType.heif\n\n表示WebP图像的类型,这种类型的标识符是com.google.webp。该类型符合UTTypeImage。\n_ = UTType.webP\n\n表示实时照片的类型,这种类型的标识符是com.apple.live-photo。该类型符合UTTypeImage。\n_ = UTType.livePhoto\n\nCommon Application Types:\n表示adobepdf文档的类型,此类型的标识符是com.adobe.pdf。该类型符合UTTypeData和uttypecompositcontent。\n_ = UTType.pdf\n\n表示富文本格式目录文档的类型,RTFD是以磁盘格式嵌入内容的RTF。这种类型的标识符是com.apple.rtfd。该类型符合UTTypePackage和uttypecompositcontent。\n_ = UTType.rtfd\n\n一种表示扁平的富文本格式目录文档的类型。该粘贴板使用扁平的富文本格式目录格式。这种类型的标识符是com.apple.flat-rtfd。该类型符合UTTypeData和uttypecompositcontent。\n_ = UTType.flatRTFD\n\n表示EPUB格式数据的类型,该类型的标识符是org.idpf.epub-container。该类型符合UTTypeData和uttypecompositcontent。\n_ = UTType.epub\n\nCompressed File Archive Types:\n表示文件和目录存档的基类型。此类型的标识符是public.archive。\n _ = UTType.archive\n\n表示zip归档文件的类型。此类型的标识符是public.zip-archive。该类型符合UTTypeData和UTTypeArchive\n_ = UTType.zip\n\n表示GNU zip归档文件的类型。这种类型的标识符是org.gnu.gnu-zip-archive。该类型符合UTTypeData和UTTypeArchive。\n_ = UTType.gzip\n\n表示bzip2存档的类型。此类型的标识符是public.bzip2-archive。该类型符合UTTypeData和UTTypeArchive。\n_ = UTType.bz2\n\nGeneric Text File Types:\n表示所有文本编码数据的基类型，包括带有标记的文本。此类型的标识符是public.text。该类型符合UTTypeData和uttypcontent。\n_ = UTType.text\n\n表示没有标记和未指定编码的文本的类型,此类型的标识符是public.plain-text。该类型符合UTTypeText。\n_ = UTType.plainText\n\n表示用UTF-8编码的纯文本的类型。该类型的标识符是public.utf8-plain-text。该类型符合UTTypePlainText。\n_ = UTType.utf8PlainText\n\n一种类型，表示以原生字节顺序编码为UTF-16的纯文本，带有可选的材料清单。该类型的标识符是public.utf16-plain-text。该类型符合UTTypePlainText。\n_ = UTType.utf16PlainText\nn一种类型，表示编码为UTF-16的纯文本，带有可选的材料清单。如果材料清单不存在，编码使用“外部字节顺序(大端顺序)，该类型的标识符是public.utf16-external-plain-text。该类型符合UTTypePlainText。\n_ = UTType.utf16ExternalPlainText\nnCommone Data Interchange Formats:\n表示包含分隔值的文本的基类型,此类型的标识符是public.delimited-values-text。该类型符合UTTypeText。\n_ = UTType.delimitedText\n\n表示包含逗号分隔值的文本的类型。此类型的标识符是public.comma-separated-values-text。该类型符合UTTypeDelimitedText\n_ = UTType.commaSeparatedText\nn一种类型，表示包含用制表符分隔的值的文本,此类型的标识符是public.tab-separated-values-text。该类型符合UTTypeDelimitedText。\n_ = UTType.tabSeparatedText\nn一种类型，表示包含以制表符分隔的值的utf -8编码的文本。这种类型的标识符是public.utf8-tab-separated-values-text。该类型符合UTTypeDelimitedText和UTTypeUTF8PlainText。\n_ = UTType.utf8TabSeparatedText\nn表示富文本格式数据的类型,该类型的标识符是public.rtf。该类型符合UTTypeText。\n_ = UTType.rtf\n\n表示通用XML数据的类型,这种类型的标识符是public.xml。该类型符合UTTypeText。\n_ = UTType.xml\n\n表示另一种标记语言数据的类型。此类型的标识符是public.yaml。该类型符合UTTypeText。\n_ = UTType.yaml\n\n一种表示JavaScript对象表示法(JSON)数据的类型,此类型的标识符是public.json。该类型符合UTTypeText;它不符合utypejavascript。\n_ = UTType.json\n\n表示属性列表的基类型。这种类型的标识符是com.apple.property-list。该类型符合UTTypeData。\n_ = UTType.propertyList\n\n表示XML属性列表的类型。这种类型的标识符是com.apple.xml-property-list。该类型符合UTTypeXML和UTTypePropertyList。\n_ = UTType.xmlPropertyList\n\n表示二进制属性列表的类型。这种类型的标识符是com.apple.binary-property-list。该类型符合UTTypePropertyList。\n_ = UTType.binaryPropertyList\n\n表示vCard文件的类型。该类型的标识符是public.vcard。该类型符合UTTypeText和UTTypeContact。\n_ = UTType.vCard\n\n一种表示公钥加密标准(PKCS) 12数据的类型。这种类型的标识符是com.rsa.pkcs-12。该类型符合UTTypeData。\n_ = UTType.pkcs12\n\n表示X.509证书的类型。此类型的标识符是public.x509-certificate。该类型符合UTTypeData。\n_ = UTType.x509Certificate\n\nInternet Specific File Types:\n表示任何HTML版本的类型。该类型的标识符是public.html。该类型符合UTTypeText。\n_ = UTType.html\n\n表示WebKit web存档数据的类型,这种类型的标识符是com.apple.webarchive。该类型符合UTTypeData和uttypecompositcontent。\n_ = UTType.webArchive\n\n表示苹果网络位置文件的基本类型,这种类型的标识符是com.apple.internet-location。该类型符合UTTypeData和一个由public.stored-url标识的基类型。\n_ = UTType.internetLocation\n\n一种代表微软互联网快捷方式文件的类型。这种类型的标识符是com.microsoft.internet-shortcut。该类型符合UTTypeData和一个由public.stored-url标识的基类型\n_ = UTType.internetShortcut\n\nGeneral Application Types:\n表示电子表格文档的基本类型。此类型的标识符是public.spreadsheet。该类型符合uttypcontent。\n_ = UTType.spreadsheet\n\n表示表示文档的基类型,此类型的标识符是public.presentation。该类型符合uttypecompositcontent。\n_ = UTType.presentation\n\n表示数据库存储的基类型。此类型的标识符是public.database。\n_ = UTType.database\n\n表示消息的基类型。此类型的标识符是public.message。\n_ = UTType.message\n\n表示联系人信息的基本类型。此类型的标识符是public.contact。\n_ = UTType.contact\n\n表示日历事件的基类型。此类型的标识符是public.calendar-event。\n_ = UTType.calendarEvent\n\n表示待办事项的类型。此类型的标识符是public.to-do-item。\n_ = UTType.toDoItem\n\n表示电子邮件消息的类型,此类型的标识符是public.email-message。该类型符合UTTypeMessage\n_ = UTType.emailMessage\n\n表示字体的基本类型。该类型的标识符是public.font。该类型符合UTTypeData。\n_ = UTType.font\n\n3D Conternt Interchange Types:\n表示3D内容的基类型。此类型的标识符是public.3d-content。该类型符合uttypcontent。\n_ = UTType.threeDContent\n\n表示通用场景描述内容的类型,这种类型的标识符是com.pixar.universal-scene-description。该类型符合UTType3DContent和UTTypeData。\n_ = UTType.usd\n\n表示通用场景描述包内容的类型。这种类型的标识符是com.pixar.universal-scene-description-mobile。该类型符合UTType3DContent和UTTypeData。\n_ = UTType.usdz\n\nApple 3D Content:\n表示Reality Composer文件的类型。这种类型的标识符是com.apple.reality。该类型符合UTTypeData。\n_ = UTType.realityFile\n\n表示SceneKit序列化场景的类型。这种类型的标识符是com.apple.scenekit.scene。该类型符合UTType3DContent和UTTypeData。\n_ = UTType.sceneKitScene\n\n表示增强现实引用对象的类型。这种类型的标识符是com.apple.arobject。该类型符合UTTypeData。\n_ = UTType.arReferenceObject\n\nCommone Programming Language Source Files:\n表示任何编程语言的源代码的基类型。此类型的标识符是public.source-code。该类型符合UTTypeText。\n_ = UTType.sourceCode\n\n"
        // Do any additional setup after loading the view.
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
