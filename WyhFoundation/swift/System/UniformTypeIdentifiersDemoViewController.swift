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
          _ = UTType.audiovisualContent
            _ = UTType.movie
            _ = UTType.video
        } else {
            // Fallback on earlier versions
        }
        
        overview.text = "Defining File and Data Types for Your App:\n声明统一类型标识符，以支持您的应用程序的专有数据格式\n应用程序可以添加新的类型，以加载、保存或传输具有专有数据格式的文件\n首先在应用的Info中声明导出或导入类型。plist文件。为每个类型标识并选择一个唯一标识符。为导出类型创建新的标识符，或为导入类型使用现有标识符。然后定义与系统声明类型的一致性，并列出任何相关的文件扩展名或MIME类型\n定义类型时，需要将其定义为导出或导入类型;这分别指示你的应用程序是类型的来源还是支持在其他地方定义的类型\n当应用程序是该类型的规范信息源时，定义一个导出类型。例如，一个应用程序使用它自己的私有文档格式应该声明它为导出类型\n如果你的应用使用了一个标准类型，不要在你的应用包中重新声明它。但是，如果你的应用程序使用了另一个应用程序定义的类型，或者是系统类型中没有声明的专有文件格式，你就需要将它定义为导入类型。当从另一个应用中导入类型时，不要声明你自己的标识符;而是使用与原始类型相同的类型标识符\n你为应用创建的标识符必须是唯一的。首先使用以com.companyName开头的反向dns格式，以确保惟一性。虽然系统可以支持具有相同规范的不同类型标识符字符串，但反过来就不正确了。标识符只能包含字母数字字符(a-z、a-z、0-9)、连字符(-)、点(.)。例如，你可以使用com.company.greatAppDocument或com.company.greatApp-document作为Info中的UTTypeIdentifier字符串。plist文件。\n不要使用public或com。Apple作为你应用类型的前缀。系统为公共域或标准类型保留公共类型。前缀dyn保留给系统在没有其他类型可用时动态生成的类型，而前缀com。apple为apple声明的类型保留。\n类型声明可以包含类型符合的类型标识符列表\n例如，如果你的应用程序使用一种私有文件格式，并且该格式基于json，那么使用public。Info中的UTTypeConformsTo字符串中的json。plist文件\n在为文档定义类型时，确保它符合public。如果你的类型不符合public. data或com.apple.package，以确保它可以在Finder或Files应用程序中表示。数据或com.apple。包，系统无法判断磁盘上的项是否具有该类型\n如果您的类型是文档，请确保它符合public。内容，直接或通过符合已经符合public.content的类型。这允许用户通过AirDrop分享你的类型\n您还可以将一致性添加到函数类型，如公共类型。数据库或public.spreadsheet。选择要遵循的最具体的子类型。这些帮助系统确定如何在Spotlight、QuickLook和用户界面的其他部分中最好地显示您的类型的文件\n如果你指定了一个非公共类型的一致性，请确保该类型也在你的bundle中声明。\n除了声明标识符之外，该类型还可以定义一个用户可读的字符串来描述该类型。说明可以进行本地化。例如，你可以使用GreatApp Document作为Info中的UTTypeDescription字符串。plist文件\n在Info中添加UTTypeTagSpecification字典。plist文件来定义您的类型的文件扩展名或MIME类型。例如，将字符串greatappdoc和greatapp添加到一个数组中，并使用公钥将其放入UTTypeTagSpecification字典中。文件名-扩展名，以支持两者作为您的类型的文件扩展名。\n下面的示例显示了添加到Info的导出示例类型。plist文件:\n<key>UTExportedTypeDeclarations</key>\n<array>\n<dict>\n<key>UTTypeIdentifier</key>\n<string>com.company.greatApp-document</string>\n<key>UTTypeConformsTo</key>\n<array>\n<string>public.json</string>\n</array>\n<key>UTTypeDescription</key>\n<string>GreatApp Document</string>\n<key>UTTypeTagSpecification</key>\n<dict>\n<key>public.filename-extension</key>\n<array>\n<string>greatappdoc</string>\n<string>greatapp</string>\n</array>\n</dict>\n</dict>\n</array>\n下表列出了类型声明中使用的可用属性键\nUTExportedTypeDeclarations--数组的字典--你的应用程序拥有的标识符的导出类型声明数组\nUTImportedTypeDeclarations--数组的字典--一组导入的类型声明，通常是由另一个公司或组织声明的类型\nUTTypeIdentifier--字符串--声明类型的标识符。这是类型声明的必需键\nUTTypeTagSpecification--字典--定义一个或多个等效类型标识符的字典。\nUTTypeConformsTo--字符串数组--此标识符符合的类型\nUTTypeDescription--字符串--这种类型的用户可见的描述。您可以通过在InfoPlist中包含该字符串来本地化该字符串。字符串文件\nUTTypeReferenceURL--字符串--描述此类型的引用文档的URL。\n如果类型的导出声明和导入声明同时存在，则导出声明优先于导入声明\n\nUTType:\n一种结构，表示要加载、发送或接收的数据类型\nUTType结构描述数据的类型信息。类型有一个唯一的标识符，并分别提供使用preferredFilenameExtension和preferredMIMEType查找首选文件名扩展名或MIME类型的方法。\n系统包含许多常见类型的静态声明，您可以通过标识符、文件名扩展名或MIME类型查找这些声明。\nUTType结构可以提供与类型相关的附加信息。附加信息的示例包括本地化的面向用户的描述、标识关于类型的技术文档的参考URL或类型的版本号。您还可以通过它们的一致性来查找类型，以获得与您的用例相关的类型或类型列表\n在应用的Info.plist中定义自己的类型。关于如何定义自己的类型，请参见为你的应用定义文件和数据类型。\n使用内置功能来标识公共资源类型\n统一类型标识符声明要从其他应用程序加载、保存或打开的资源的公共类型。声明的类型包括在定义自己的专有数据类型时要引用的基类型。\naudiovisualContent--一种基类型，表示包含视频内容的数据，视频内容可能包括音频，也可能不包括音频。\nmovie--一种基本类型，表示可能同时包含视频和音频的媒体格式。\nvideo--表示不包含音频的视频的类型。"
        exmaple.text = " _ = UTType.audiovisualContent\n_ = UTType.movie\n_ = UTType.video"
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
