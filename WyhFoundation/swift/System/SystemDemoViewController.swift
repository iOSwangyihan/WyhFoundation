//
//  SystemDemoViewController.swift
//  WyhFoundation
//
//  Created by 王乙涵 on 2021/5/25.
//

import UIKit
import System
class SystemDemoViewController: BaseDemoViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 14.0, *) {
            _ = FileDescriptor.OpenOptions.exclusiveLock
            _ = FileDescriptor.OpenOptions.exclusiveCreate
            _ = FileDescriptor.OpenOptions.eventOnly
            _ = FileDescriptor.OpenOptions.create
            _ = FileDescriptor.OpenOptions.closeOnExec
            let file = FileDescriptor(rawValue: 0)
            _ = file.rawValue
            _ = FileDescriptor.RawValue.self
            _ = try? FileDescriptor.open(.init(""), .readOnly, options: .append, permissions: .none, retryOnInterrupt: true)
            _ = try? FileDescriptor.open(.init(""), .readWrite, options: .create, permissions: .groupExecute, retryOnInterrupt: false)
            _ = FileDescriptor.AccessMode.readOnly
            _ = FileDescriptor.AccessMode.readWrite
            let m = FileDescriptor.AccessMode.writeOnly
            _ = m.description
            _ = m.debugDescription
            let acces = FileDescriptor.AccessMode(rawValue: 0)
            _ = acces.rawValue
            _ = FileDescriptor.AccessMode.RawValue.self
            _ = FileDescriptor.AccessMode.readOnly != .readWrite
            var h = Hasher()
            acces.hash(into: &h)
            _ = acces.hashValue
            try? acces.encode(to: JSONEncoder.init() as! Encoder)
           _ = try? FileDescriptor.AccessMode(from: JSONDecoder.init() as! Decoder)
            _ = FileDescriptor.OpenOptions.append
        } else {
            // Fallback on earlier versions
        }
        navi.title = "System--demo"
        overview.text = "Adopting Swift File Operations:\n使用System模块提供的文件操作，将现有的C代码迁移到Swift.用于文件操作的C函数映射到Swift如下:\nclose ⟶ close()\nlseek ⟶ seek(offset:from:)\nopen ⟶ open(_:_:options:permissions:retryOnInterrupt:)\npread ⟶ read(fromAbsoluteOffset:into:retryOnInterrupt:)\npwrite ⟶ write(toAbsoluteOffset:_:retryOnInterrupt:)\nread ⟶ read(into:retryOnInterrupt:)\nwrite ⟶ write(_:retryOnInterrupt:)\n\nAdopting Swift File Options:\n使用System模块提供的文件操作选项，将现有的C代码迁移到Swift\n如何打开文件映射到Swift的C选项如下:\nO_RDONLY ⟶ readOnly\nO_WRONLY ⟶ writeOnly\nO_RDWR ⟶ readWrite\n当打开一个文件映射到Swift时，指定选项的C常量如下:\nO_NONBLOCK ⟶ nonBlocking\nO_APPEND ⟶ append\nO_CREAT ⟶ create\nO_TRUNC ⟶ truncate\nO_EXCL ⟶ exclusiveCreate\nO_SHLOCK ⟶ sharedLock\nO_EXLOCK ⟶ exclusiveLock\nO_NOFOLLOW ⟶ noFollow\nO_SYMLINK ⟶ symlink\nO_EVTONLY ⟶ eventOnly\nO_CLOEXEC ⟶ closeOnExec\n指定查找偏移量的C常量映射到Swift如下:\nSEEK_SET ⟶ start\nSEEK_CUR ⟶ current\nSEEK_END ⟶ end\nSEEK_HOLE ⟶ nextHole\nSEEK_DATA ⟶ nextData\n\nAdopting Swift Error Constants:\n使用System模块提供的错误常量，将现有的C代码迁移到Swift.C错误常数映射到Swift如下:\nE2BIG ⟶ argListTooLong\nEACCES ⟶ permissionDenied\nEADDRINUSE ⟶ addressInUse\nEADDRNOTAVAIL ⟶ addressNotAvailable\nEAFNOSUPPORT ⟶ addressFamilyNotSupported\nEAGAIN ⟶ resourceTemporarilyUnavailable\nEALREADY ⟶ alreadyInProcess\nEAUTH ⟶ authenticationError\nEBADARCH ⟶ badCPUType\nEBADEXEC ⟶ badExecutable\nEBADF ⟶ badFileDescriptor\nEBADMACHO ⟶ malformedMachO\nEBADMSG ⟶ badMessage\nEBADRPC ⟶ rpcUnsuccessful\nEBUSY ⟶ resourceBusy\nECANCELED ⟶ canceled\nECHILD ⟶ noChildProcess\nECONNABORTED ⟶ connectionAbort\nECONNREFUSED ⟶ connectionRefused\nECONNRESET ⟶ connectionReset\nEDEADLK ⟶ deadlock\nEDESTADDRREQ ⟶ addressRequired\nEDEVERR ⟶ deviceError\nEDOM ⟶ outOfDomain\nEDQUOT ⟶ diskQuotaExceeded\nEEXIST ⟶ fileExists\nEFAULT ⟶ badAddress\nEFBIG ⟶ fileTooLarge\nEFTYPE ⟶ badFileTypeOrFormat\nEHOSTDOWN ⟶ hostIsDown\nEHOSTUNREACH ⟶ noRouteToHost\nEIDRM ⟶ identifierRemoved\nEILSEQ ⟶ illegalByteSequence\nEINPROGRESS ⟶ nowInProgress\nEINTR ⟶ interrupted\nEINVAL ⟶ invalidArgument\nEIO ⟶ ioError\nEISCONN ⟶ socketIsConnected\nEISDIR ⟶ isDirectory\nELAST ⟶ lastErrnoValue\nELOOP ⟶ tooManySymbolicLinkLevels\nEMFILE ⟶ tooManyOpenFiles\nEMLINK ⟶ tooManyLinks\nEMSGSIZE ⟶ messageTooLong\nEMULTIHOP ⟶ multiHop\nENAMETOOLONG ⟶ fileNameTooLong\nENEEDAUTH ⟶ needAuthenticator\nENETDOWN ⟶ networkDown\nENETRESET ⟶ networkReset\nENETUNREACH ⟶ networkUnreachable\nENFILE ⟶ tooManyOpenFilesInSystem\nENOATTR ⟶ attributeNotFound\nENOBUFS ⟶ noBufferSpace\nENODATA ⟶ noData\nENODEV ⟶ operationNotSupportedByDevice\nENOENT ⟶ noSuchFileOrDirectory\nENOEXEC ⟶ execFormatError\nENOLCK ⟶ noLocks\nENOLINK ⟶ noLink\nENOMEM ⟶ noMemory\nENOMSG ⟶ noMessage\nENOPOLICY ⟶ noSuchPolicy\nENOPROTOOPT ⟶ protocolNotAvailable\nENOSPC ⟶ noSpace\nENOSR ⟶ noStreamResources\nENOSTR ⟶ notStream\nENOSYS ⟶ noFunction\nENOTBLK ⟶ notBlockDevice\nENOTCONN ⟶ socketNotConnected\nENOTDIR ⟶ notDirectory\nENOTEMPTY ⟶ directoryNotEmpty\nENOTRECOVERABLE ⟶ notRecoverable\nENOTSOCK ⟶ notSocket\nENOTSUP ⟶ notSupported\nENOTTY ⟶ inappropriateIOCTLForDevice\nENXIO ⟶ noSuchAddressOrDevice\nEOPNOTSUPP ⟶ notSupportedOnSocket\nEOVERFLOW ⟶ overflow\nEOWNERDEAD ⟶ previousOwnerDied\nEPERM ⟶ notPermitted\nEPFNOSUPPORT ⟶ protocolFamilyNotSupported\nEPIPE ⟶ brokenPipe\nEPROCLIM ⟶ tooManyProcesses\nEPROCUNAVAIL ⟶ rpcProcedureUnavailable\nEPROGMISMATCH ⟶ rpcProgramVersionMismatch\nEPROGUNAVAIL ⟶ rpcProgramUnavailable\nEPROTONOSUPPORT ⟶ protocolNotSupported\nEPROTOTYPE ⟶ protocolWrongTypeForSocket\nEPROTO ⟶ protocolError\nEPWROFF ⟶ devicePowerIsOff\nEQFULL ⟶ outputQueueFull\nERANGE ⟶ outOfRange\nEREMOTE ⟶ tooManyRemoteLevels\nEROFS ⟶ readOnlyFileSystem\nERPCMISMATCH ⟶ rpcVersionMismatch\nESHLIBVERS ⟶ sharedLibraryVersionMismatch\nESHUTDOWN ⟶ socketShutdown\nESOCKTNOSUPPORT ⟶ socketTypeNotSupported\nESPIPE ⟶ illegalSeek\nESRCH ⟶ noSuchProcess\nESTALE ⟶ staleNFSFileHandle\nETIMEDOUT ⟶ timedOut\nETIME ⟶ timeout\nETOOMANYREFS ⟶ tooManyReferences\nETXTBSY ⟶ textFileBusy\nEUSERS ⟶ tooManyUsers\nEWOULDBLOCK ⟶ wouldBlock\nEXDEV ⟶ improperLink\n\nFileDescriptor:\n输入或输出数据资源(如文件或套接字)的抽象句柄。您负责管理FileDescriptor值的生存期和有效性，与管理原始C文件句柄的方式相同。\n\nFileDescriptor.AccessMode:对新打开的文件所需的读和写权限。\n\nFileDescriptor.OpenOptions:\n指定新打开文件的行为的选项。"
        exmaple.text = "从原始C文件句柄创建强类型文件句柄。\n _ = FileDescriptor(rawValue: 0)\n\n原始的C文件句柄。\n_ = file.rawValue\n\n原始类型，可用于表示符合类型的所有值。每个符合类型的不同值都有一个对应的唯一RawValue类型的值，但也可能有RawValue类型的值没有相应的符合类型的值。\n _ = FileDescriptor.RawValue.self\n\n打开或创建用于读写的文件。相应的C函数是打开的。\n_ = try? FileDescriptor.open(.init(\"\"), .readOnly, options: .append, permissions: .none, retryOnInterrupt: true)\n\n打开或创建用于读写的文件。相应的C函数是打开的。\n _ = try? FileDescriptor.open(.init(\"\"), .readWrite, options: .create, permissions: .groupExecute, retryOnInterrupt: false)\n\n打开仅为读取的文件。对应的C常量是O_RDONLY。\n_ = FileDescriptor.AccessMode.readOnly\n\n打开文件进行读写。对应的C常量是O_RDWR。\n_ = FileDescriptor.AccessMode.readWrite\n\n打开仅用于写入的文件。对应的C常量是O_WRONLY。\nlet m = FileDescriptor.AccessMode.writeOnly\n\n访问模式的文本表示形式。\n_ = m.description\n\n访问模式的文本表示形式，适合于调试\n_ = m.debugDescription\n\n从原始C访问模式创建强类型访问模式。\nlet acces = FileDescriptor.AccessMode(rawValue: 0)\n原始C访问模式。\n_ = acces.rawValue\n\n原始类型，可用于表示符合类型的所有值。每个符合类型的不同值都有一个对应的唯一RawValue类型的值，但也可能有RawValue类型的值没有相应的符合类型的值。\n_ = FileDescriptor.AccessMode.RawValue.self\n_ = FileDescriptor.AccessMode.readOnly != .readWrite\nvar h = Hasher()\n_ = acces.hash(into: &h)\n_ = acces.hashValue\n当类型的RawValue为Int32时，将此值编码到给定的编码器中。如果任何值对于给定的编码器格式无效，此函数将抛出错误。\ntry? acces.encode(to: JSONEncoder.init() as! Encoder)\n\n当类型的RawValue为Int32时，通过从给定的解码器解码创建一个新实例。如果从解码器读取失败，或者读取的数据损坏或无效，此初始化式将抛出一个错误。\ntry? FileDescriptor.AccessMode(from: JSONDecoder.init() as! Decoder)\n\n指示每个写入操作追加到文件。如果指定了这个选项，则每次写入文件时，新数据将写入文件的末尾，即所有现有文件数据之后。对应的C常量是O_APPEND。\n_ = FileDescriptor.OpenOptions.append\n\n指示执行程序关闭文件。通常，文件描述符在对exec(2)函数族的调用之间保持开放。如果指定此选项，则在用另一个进程替换此进程时将关闭文件描述符。可以使用F_GETFD检查文件描述符标志的状态，如fcntl(2)手册页所述。对应的C常量是O_CLOEXEC。\n_ = FileDescriptor.OpenOptions.closeOnExec\n\n指示打开文件将在文件不存在时创建该文件。对应的C常量是O_CREAT。\n_ = FileDescriptor.OpenOptions.create\n\n指示打开文件监视文件的更改。当打开用于事件通知的文件时指定此选项，例如kqueue(2)函数返回的文件句柄，而不是用于读写。使用此选项打开的文件不会阻止卸载包含它们的卷。对应的C常量是O_EVTONLY。\n_ = FileDescriptor.OpenOptions.eventOnly\n\n指示打开该文件将创建该文件，并期望它不存在。如果此选项和create都被指定，并且文件存在，doc:System/FileDescriptor/open(_:_:options:permissions:)-10dcs返回一个错误，而不是创建文件。例如，您可以使用它来实现一个简单的独占访问锁定机制。如果同时指定了这个选项和create，并且文件路径的最后一个组件是符号链接，那么即使符号链接指向一个不存在的名称，doc:System/FileDescriptor/open(_:_:options:permissions:)-10dcs也会失败。对应的C常量是O_EXCL。\n_ = FileDescriptor.OpenOptions.exclusiveCreate\n\n指示以原子方式打开文件会获得排他锁。设置此选项或sharedLock选项。使用flock(2)语义获取一个锁。如果您正在使用create选项创建文件，那么对锁的请求总是成功的，除非在不支持锁定的文件系统上。对应的C常量是O_EXLOCK。\n_ = FileDescriptor.OpenOptions.exclusiveLock"
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
