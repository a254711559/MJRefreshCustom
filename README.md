# 自定义mjrefresh的下拉和上拉动画
### 核心所在就是重写父类的layoutsubView方法 调整子控件的frame
### 另外遇到的一个坑点就是 如果UI给的图片的尺寸略大，mj里面会根据图片的真是大小调整frame，这个时候图片就会溢出看起来很不美观，
### 这里就需要自己限定好gifview的size 并且调整contenmode 为 UIViewContentModeScaleAspectFit 
