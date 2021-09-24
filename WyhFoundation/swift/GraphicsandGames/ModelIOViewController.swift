//
//  ModelIOViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/9/24.
//







import UIKit
enum ModelIOViewControllerType {
    case overview
    case topics
    case demo
    func name() -> String {
        switch self {
        case .overview:
            return "Framework:iOS9+\n使用集成了MetalKit、GLKit和SceneKit的公共基础设施导入、导出和操作3D模型。"
        case .topics:
            return "MDLAsset--3D对象和相关信息(如转换层次结构、网格、摄像机和灯光)的索引容器。\nMDLObject--作为3D资产一部分的对象的基类，包括网格、摄像机和灯光。\nMDLTransform--对三维物体的局部坐标空间变换的描述。\nMDLMesh--用于渲染3D对象的顶点缓冲区数据的容器。\nMDLSubmesh--用于绘制全部或部分3D对象的索引缓冲数据和材料信息的容器。\nMDLSubmeshTopology--描述子网格的索引缓冲区数据是如何排列的，以及如何使用这种排列来产生子网格的预期3D形状。\nMDLNamed--公开人类可读名称的模型I/O对象的公共接口。\nMDLMeshBuffer--用于管理在加载、处理和绘制网格时使用的顶点和索引数据的存储的通用接口。\nMDLMeshBufferAllocator--用于管理用于加载、处理和呈现网格的数据缓冲区分配的通用接口。\nMDLMeshBufferData--为模型I/O网格存储顶点或索引数据的内存缓冲区。\nMDLMeshBufferDataAllocator--基本的分配器实现，使用数据对象从主内存中进行分配。\nMDLMeshBufferMap--管理对用于模型I/O网格数据存储的内存缓冲区的访问的对象。\nMDLMeshBufferZone--用于分配相关网格数据缓冲区的逻辑内存池的通用接口。\nMDLMeshBufferZoneDefault--MDLMeshBufferZone协议的标准实现。\nMDLVertexAttribute--对网格对象中单个顶点属性的逐顶点数据格式的描述。\nMDLVertexAttributeData--为网格的特定顶点属性提供方便的顶点数据访问的对象。\nMDLVertexBufferLayout--MDLVertexBufferLayout对象描述了MDLMesh对象中顶点缓冲区的布局信息。一个顶点层对象、顶点属性对象和其他信息的集合形成了一个MDLVertexDescriptor对象，它完整地描述了一个网格的顶点缓冲区的布局。\nMDLVertexDescriptor--对与网格相关联的顶点数据缓冲区的结构、格式和布局的描述。\nMDLMaterial--材质属性的集合，共同描述渲染3D对象所需的表面外观。\nMDLMaterialProperty--材质呈现参数的一个特定方面的定义。\nMDLScatteringFunction--一组材质属性，用于描述材质的基本材质模型，以及用于更复杂材质模型的超类。\nMDLPhysicallyPlausibleScatteringFunction--一组材料属性，描述了材料的物理现实着色模型。\nMDLTexture--用于渲染材料表面外观的texel数据的来源。\nMDLColorSwatchTexture--一个texel数据生成器，在两个指定的颜色之间创建渐变。\nMDLNoiseTexture--一种产生随机噪声的texel数据的生成器。\nMDLNormalMapTexture--一种texel数据生成器，从提供的纹理计算法线贴图。\nMDLSkyCubeTexture--一个生成texel数据，创建立方体纹理使用物理现实模拟的阳光天空。\nMDLURLTexture--对URL的轻量级引用，从中加载纹理数据。\nMDLTextureFilter--当从纹理中采样时渲染器使用的过滤模式的描述。\nMDLTextureSampler--一种对象，它将纹理数据源与用于渲染纹理的采样参数配对。\nMDLLight--描述场景中光源的对象的抽象超类。\nMDLAreaLight--从特定形状的区域照亮3D场景的光源。\nMDLLightProbe--根据其在各个方向上的亮度和颜色的变化来描述的光源。\nMDLLightProbeIrradianceDataSource--采用此协议为在场景周围自动放置光探头提供信息。\nMDLPhotometricLight--一种光源，其形状、方向和照明强度由光度剖面决定。\nMDLPhysicallyPlausibleLight--一个光源，用于基于真实世界物理的阴影模型。\nMDLCamera--用于渲染3D场景的一个视图，以及一组描述用于渲染的预期外观的参数。\nMDLStereoscopicCamera--用于渲染三维场景的立体显示的一种视角。\nMDLComponent--模型I/O中支持可扩展文件格式的基本协议。\nMDLObjectContainer--用于在3D资源中处理对象层次关系的默认实现。\nMDLObjectContainerComponent--在对象层次结构中充当容器的类的通用接口。\nMDLTransformComponent--用于管理3D对象的局部坐标空间转换的类的通用接口\nMDLVoxelArray--作为体素或立方单位集合的三维物体的实体体积模型。\n"
        case .demo:
            return "Click here to example"
        }
    }
}
class ModelIOViewController: SwiftViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = [ModelIOViewControllerType.overview, ModelIOViewControllerType.topics, ModelIOViewControllerType.demo]
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = (dataArr[indexPath.row] as? ModelIOViewControllerType)?.name()
        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArr[indexPath.row] as? ModelIOViewControllerType ?? ModelIOViewControllerType.overview
        if type == .demo {
           
            if #available(iOS 13.0, *) {
                let vc = ModelIODemoViewController()
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

