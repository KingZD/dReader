package com.dd.dreader

import android.app.Activity
import android.os.Bundle

/**
 * Author: zed
 * Date: 2020/5/13 17:44
 * Description: 基类
 * History:
 * <author> <time> <version> <desc>
 * 作者姓名 修改时间 版本号 描述
 */
abstract class BaseActivity :Activity(){
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(setLayoutId());
    }

    /**
     * 设置布局
     */
    abstract fun setLayoutId():Int
}