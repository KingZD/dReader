package com.dd.dreader.widget

import android.content.Context
import android.graphics.Canvas
import android.graphics.Paint
import android.util.AttributeSet
import android.view.View

/**
 * Author: zed
 * Date: 2020/5/13 18:01
 * Description: 录音水波线
 * History:
 * <author> <time> <version> <desc>
 * 作者姓名 修改时间 版本号 描述
 */

class AudioWaveView : View{
    constructor(context: Context?) : super(context)
    constructor(context: Context?, attrs: AttributeSet?) : super(context, attrs)
    constructor(context: Context?, attrs: AttributeSet?, defStyleAttr: Int) : super(context, attrs, defStyleAttr)



    override fun onDraw(canvas: Canvas?) {
        super.onDraw(canvas)

        canvas?.drawText("等会这里绘制水波纹",0f,0f,Paint());
    }
}