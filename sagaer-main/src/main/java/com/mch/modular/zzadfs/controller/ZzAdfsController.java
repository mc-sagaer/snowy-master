/*
Copyright [2020] [https://www.xiaonuo.vip]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

Snowy采用APACHE LICENSE 2.0开源协议，您在使用过程中，需要注意以下几点：

1.请不要删除和修改根目录下的LICENSE文件。
2.请不要删除和修改Snowy源码头部的版权声明。
3.请保留源码和相关描述文件的项目出处，作者声明等。
4.分发源码时候，请注明软件出处 https://gitee.com/xiaonuobase/snowy
5.在修改包名，模块名称，项目代码等时，请注明软件出处 https://gitee.com/xiaonuobase/snowy
6.若您的项目无法满足以上几点，可申请商业授权，获取Snowy商业授权许可，请在官网购买授权，地址为 https://www.xiaonuo.vip
 */
package com.mch.modular.zzadfs.controller;

import com.mch.core.enums.LogAnnotionOpTypeEnum;
import com.mch.core.pojo.response.ResponseData;
import com.mch.core.pojo.response.SuccessResponseData;
import com.mch.modular.zzadfs.param.ZzAdfsParam;
import com.mch.modular.zzadfs.service.ZzAdfsService;
import com.mch.core.annotion.BusinessLog;
import com.mch.core.annotion.Permission;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import javax.annotation.Resource;
import java.util.List;

/**
 * 用户表控制器
 *
 * @author mch
 * @date 2021-08-03 16:56:51
 */
@RestController
public class ZzAdfsController {

    @Resource
    private ZzAdfsService zzAdfsService;

    /**
     * 查询用户表
     *
     * @author mch
     * @date 2021-08-03 16:56:51
     */
    @Permission
    @GetMapping("/zzAdfs/page")
    @BusinessLog(title = "用户表_查询", opType = LogAnnotionOpTypeEnum.QUERY)
    public ResponseData page(ZzAdfsParam zzAdfsParam) {
        return new SuccessResponseData(zzAdfsService.page(zzAdfsParam));
    }

    /**
     * 添加用户表
     *
     * @author mch
     * @date 2021-08-03 16:56:51
     */
    @Permission
    @PostMapping("/zzAdfs/add")
    @BusinessLog(title = "用户表_增加", opType = LogAnnotionOpTypeEnum.ADD)
    public ResponseData add(@RequestBody @Validated(ZzAdfsParam.add.class) ZzAdfsParam zzAdfsParam) {
            zzAdfsService.add(zzAdfsParam);
        return new SuccessResponseData();
    }

    /**
     * 删除用户表，可批量删除
     *
     * @author mch
     * @date 2021-08-03 16:56:51
     */
    @Permission
    @PostMapping("/zzAdfs/delete")
    @BusinessLog(title = "用户表_删除", opType = LogAnnotionOpTypeEnum.DELETE)
    public ResponseData delete(@RequestBody @Validated(ZzAdfsParam.delete.class) List<ZzAdfsParam> zzAdfsParamList) {
            zzAdfsService.delete(zzAdfsParamList);
        return new SuccessResponseData();
    }

    /**
     * 编辑用户表
     *
     * @author mch
     * @date 2021-08-03 16:56:51
     */
    @Permission
    @PostMapping("/zzAdfs/edit")
    @BusinessLog(title = "用户表_编辑", opType = LogAnnotionOpTypeEnum.EDIT)
    public ResponseData edit(@RequestBody @Validated(ZzAdfsParam.edit.class) ZzAdfsParam zzAdfsParam) {
            zzAdfsService.edit(zzAdfsParam);
        return new SuccessResponseData();
    }

    /**
     * 查看用户表
     *
     * @author mch
     * @date 2021-08-03 16:56:51
     */
    @Permission
    @GetMapping("/zzAdfs/detail")
    @BusinessLog(title = "用户表_查看", opType = LogAnnotionOpTypeEnum.DETAIL)
    public ResponseData detail(@Validated(ZzAdfsParam.detail.class) ZzAdfsParam zzAdfsParam) {
        return new SuccessResponseData(zzAdfsService.detail(zzAdfsParam));
    }

    /**
     * 用户表列表
     *
     * @author mch
     * @date 2021-08-03 16:56:51
     */
    @Permission
    @GetMapping("/zzAdfs/list")
    @BusinessLog(title = "用户表_列表", opType = LogAnnotionOpTypeEnum.QUERY)
    public ResponseData list(ZzAdfsParam zzAdfsParam) {
        return new SuccessResponseData(zzAdfsService.list(zzAdfsParam));
    }

    /**
     * 导出系统用户
     *
     * @author mch
     * @date 2021-08-03 16:56:51
     */
    @Permission
    @GetMapping("/zzAdfs/export")
    @BusinessLog(title = "用户表_导出", opType = LogAnnotionOpTypeEnum.EXPORT)
    public void export(ZzAdfsParam zzAdfsParam) {
        zzAdfsService.export(zzAdfsParam);
    }

}
