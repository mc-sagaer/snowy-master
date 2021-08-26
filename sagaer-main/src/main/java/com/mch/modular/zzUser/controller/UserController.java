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
package com.mch.modular.zzUser.controller;

import com.mch.core.enums.LogAnnotionOpTypeEnum;
import com.mch.core.pojo.response.ResponseData;
import com.mch.core.pojo.response.SuccessResponseData;
import com.mch.core.annotion.BusinessLog;
import com.mch.core.annotion.Permission;
import com.mch.modular.zzUser.param.UserParam;
import com.mch.modular.zzUser.service.UserService;
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
 * @date 2021-08-03 16:51:50
 */
@RestController
public class UserController {

    @Resource
    private UserService userService;

    /**
     * 查询用户表
     *
     * @author mch
     * @date 2021-08-03 16:51:50
     */
    @Permission
    @GetMapping("/user/page")
    @BusinessLog(title = "用户表_查询", opType = LogAnnotionOpTypeEnum.QUERY)
    public ResponseData page(UserParam userParam) {
        return new SuccessResponseData(userService.page(userParam));
    }

    /**
     * 添加用户表
     *
     * @author mch
     * @date 2021-08-03 16:51:50
     */
    @Permission
    @PostMapping("/user/add")
    @BusinessLog(title = "用户表_增加", opType = LogAnnotionOpTypeEnum.ADD)
    public ResponseData add(@RequestBody @Validated(UserParam.add.class) UserParam userParam) {
            userService.add(userParam);
        return new SuccessResponseData();
    }

    /**
     * 删除用户表，可批量删除
     *
     * @author mch
     * @date 2021-08-03 16:51:50
     */
    @Permission
    @PostMapping("/user/delete")
    @BusinessLog(title = "用户表_删除", opType = LogAnnotionOpTypeEnum.DELETE)
    public ResponseData delete(@RequestBody @Validated(UserParam.delete.class) List<UserParam> userParamList) {
            userService.delete(userParamList);
        return new SuccessResponseData();
    }

    /**
     * 编辑用户表
     *
     * @author mch
     * @date 2021-08-03 16:51:50
     */
    @Permission
    @PostMapping("/user/edit")
    @BusinessLog(title = "用户表_编辑", opType = LogAnnotionOpTypeEnum.EDIT)
    public ResponseData edit(@RequestBody @Validated(UserParam.edit.class) UserParam userParam) {
            userService.edit(userParam);
        return new SuccessResponseData();
    }

    /**
     * 查看用户表
     *
     * @author mch
     * @date 2021-08-03 16:51:50
     */
    @Permission
    @GetMapping("/user/detail")
    @BusinessLog(title = "用户表_查看", opType = LogAnnotionOpTypeEnum.DETAIL)
    public ResponseData detail(@Validated(UserParam.detail.class) UserParam userParam) {
        return new SuccessResponseData(userService.detail(userParam));
    }

    /**
     * 用户表列表
     *
     * @author mch
     * @date 2021-08-03 16:51:50
     */
    @Permission
    @GetMapping("/user/list")
    @BusinessLog(title = "用户表_列表", opType = LogAnnotionOpTypeEnum.QUERY)
    public ResponseData list(UserParam userParam) {
        return new SuccessResponseData(userService.list(userParam));
    }

    /**
     * 导出系统用户
     *
     * @author mch
     * @date 2021-08-03 16:51:50
     */
    @Permission
    @GetMapping("/user/export")
    @BusinessLog(title = "用户表_导出", opType = LogAnnotionOpTypeEnum.EXPORT)
    public void export(UserParam userParam) {
        userService.export(userParam);
    }

}
