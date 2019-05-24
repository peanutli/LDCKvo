import Cocoa

var str = "这是一个测试数据😊😊"
//let count1 = str.lengthOfBytes(using: String.Encoding.utf8) //每个汉字占3个字节

for i in str.characters {
    print(i)
}

/**
 * sanguo：
        wei ： caocao dianwei xiaohouchun caiwenji lvbu diaochan simayi
        shu :  liubei zhugeliang huangzhong guanyu zhangfei zhaoyun
        wu  :  sunce daqiao xiaoqiao sunshangxiang zhouyu
    changcheng:
        huamulan , kai ,bailixuance ,bailishouyue,sulie
 
    mozi,bianque,
    niumo ,zhubajie ,sunwukong,
 */

/**
 *
 *如何自己高效实现NSUserDefault?
 
 
    //高效 存储这块  存储的数据类型：  缓存，硬盘
 
        缓存  存储类型   存储手段   读取  读取方式 ，读取手段   API设计  通过key存  通过key取  数据类型     oc的基本数据类型，注意一点是，(要存的是对象，不是对象的引用)
        硬盘
        全局
        分层
 
        即时写入，不即时写入问题
 
 
        存  把数据写入硬盘
        取  从数据从硬盘读出来
 
        Hash表 存着 key 和  对应 的value 值的地址， 找到地址，就可以读出来了。
               存   存的时候，把value 存起来， 找到地址 ，地址写到 key 对应的内存 上。
 
        Hash 表也存起来  ， 读的时候，还能把这个Hash表读出来 。读出来之后，就能够根据key 去查找，去保存。
 
        plist: 序列化
 
 */


/*
 *
    长连接，短连接 , http ,tcp ,tcp/ip socket 心跳策略
 
    1.http 与 tcp/ip 协议之间关系
    2.http 与tcp /socket 之间连接
    3.长连接，短连接
    4.http 长连接，短连接 与 tcp 长连接，短连接区别
    5.手写一次tcp长连接
    6.心跳策略
 *
 *  2.1 http ,tcp ,socket 关系  http 应用层 tcp -> 传输层， （ http 包装数据，每次请求，都有响应 request ressponse,response结束，断掉链接）     （ tcp  传输数据 ,响应，三次握手）
     1.0 每次request 单独建立 连接  response 释放  短连接
     1.1 一次连接 多个request requests 可以重叠  ，不需要 等待一个请求结束，在发起下一个 。 这种叫 长连接。
        request-header keep-alive:true    response-header: connection: keep-alive
 
     2.2  tcp  手机联网  手机底层 实现了 tcp/ip 协议   手机终端  通过 无线网络  建立 tcp 连接
 
         tcp 可以对上层网络 提供接口  使上层网络的传输 建立在无差别的网络上
 
         tcp 连接 需要 三次握手 ，断开 需要 四次 握手
 
         建立连接  三次 握手  喂喂喂
         数据 传输 哈哈哈
         断开连接  四次 握手  喂 （喂喂） 喂
 
    2.3 socket 套接字  支持 tcp,ip 协议的基本单元
        网络通信过程中 断点的抽象表示
        socket 包含五种信息，连接使用的协议 ， 本地主机的ip地址，本地进程的协议端口，远程主机的ip地址，远地进程的协议端口
 
        套接字的连接过程：
        服务器监听， 客户端请求 ，连接确认
 
        等待连接的状态：
        客户端连接：描述需要连接的服务器的套接字关键字。  套接字的：地址和端口
        确认连接： 服务器套接字，监听到客户端套接字的请求，就响应客户端套接字的请求，
                建立一个新的进程，服务端套接字描述发给客户端，一旦客户端确认了描述，双方就正式建立了连接。
 
    socket 和 http 之间关系
 
        socket 长连接，跟服务器之间，能相互通信， 客户端和服务器之间需要穿过多个 结点  （路由，防火墙，网关）容易被终止，就断了。
 
        轮询连接：就是轮询告诉网络，目前还是处于可控制状态。 （心跳包）
 
 
    Http长连接和短链接、
     建立连接之后，得到响应之后，建立的连接不断开，下次在访问这个服务器上的内容，连接不是直接断开，
 
    手写一次tcp 长连接
 
 
    心跳策略：
 
    测试心跳   看结果   成功   失败    失败  继续测试 ，如果连续5次都失败
 
    测试心跳，用轮询的方式  每隔一段间隔 检测一下心跳 ，假设 间隔 是 5秒 。
 
    失败，要重新尝试建立 socket 连接
 
    
 
 *
 */
