# TFQWeakTimer
让大家拿过来就能用且没有循环引用的Timer。
具体解释见文章[代理模式管理NSTimer解决循环引用](https://juejin.im/post/5b4824f06fb9a04fbf26fed2)

### TFQWeakTimer使用方法
1、将TFQWeakTimer类拖到自己项目中。
2、通过initWithXXX方法创建定时器.
3、在需要销毁TFQWeakTimer或者当前类dealloc的时候调用TFQWeakTimer中的对象方法invalidateTimer销毁TFQWeakTimer

### 期待：
有什么问题请Issues我，或者到掘金去给我评论，一定及时回复。

有什么想法也可以Pull requests，想法好一定同意commit
