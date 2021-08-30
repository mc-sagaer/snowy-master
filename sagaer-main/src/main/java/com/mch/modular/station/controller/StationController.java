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
package com.mch.modular.station.controller;

import com.mch.core.annotion.BusinessLog;
import com.mch.core.annotion.Permission;
import com.mch.core.enums.LogAnnotionOpTypeEnum;
import com.mch.core.pojo.response.ResponseData;
import com.mch.core.pojo.response.SuccessResponseData;
import com.mch.modular.station.param.StationParam;
import com.mch.modular.station.service.StationService;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import javax.annotation.Resource;
import java.util.List;

/**
 * 变电站基本信息控制器
 *
 * @author mach
 * @date 2021-08-27 09:48:02
 */
@RestController
public class StationController {

    @Resource
    private StationService stationService;

    /**
     * 查询变电站基本信息
     *
     * @author mach
     * @date 2021-08-27 09:48:02
     */
    @Permission
    @GetMapping("/station/page")
    @BusinessLog(title = "变电站基本信息_查询", opType = LogAnnotionOpTypeEnum.QUERY)
    public ResponseData page(StationParam stationParam) {
        return new SuccessResponseData(stationService.page(stationParam));
    }

    /**
     * 添加变电站基本信息
     *
     * @author mach
     * @date 2021-08-27 09:48:02
     */
    @Permission
    @PostMapping("/station/add")
    @BusinessLog(title = "变电站基本信息_增加", opType = LogAnnotionOpTypeEnum.ADD)
    public ResponseData add(@RequestBody @Validated(StationParam.add.class) StationParam stationParam) {
            stationService.add(stationParam);
        return new SuccessResponseData();
    }

    /**
     * 删除变电站基本信息，可批量删除
     *
     * @author mach
     * @date 2021-08-27 09:48:02
     */
    @Permission
    @PostMapping("/station/delete")
    @BusinessLog(title = "变电站基本信息_删除", opType = LogAnnotionOpTypeEnum.DELETE)
    public ResponseData delete(@RequestBody @Validated(StationParam.delete.class) List<StationParam> stationParamList) {
            stationService.delete(stationParamList);
        return new SuccessResponseData();
    }

    /**
     * 编辑变电站基本信息
     *
     * @author mach
     * @date 2021-08-27 09:48:02
     */
    @Permission
    @PostMapping("/station/edit")
    @BusinessLog(title = "变电站基本信息_编辑", opType = LogAnnotionOpTypeEnum.EDIT)
    public ResponseData edit(@RequestBody @Validated(StationParam.edit.class) StationParam stationParam) {
            stationService.edit(stationParam);
        return new SuccessResponseData();
    }

    /**
     * 查看变电站基本信息
     *
     * @author mach
     * @date 2021-08-27 09:48:02
     */
    @Permission
    @GetMapping("/station/detail")
    @BusinessLog(title = "变电站基本信息_查看", opType = LogAnnotionOpTypeEnum.DETAIL)
    public ResponseData detail(@Validated(StationParam.detail.class) StationParam stationParam) {
        return new SuccessResponseData(stationService.detail(stationParam));
    }

    /**
     * 变电站基本信息列表
     *
     * @author mach
     * @date 2021-08-27 09:48:02
     */
    @Permission
    @GetMapping("/station/list")
    @BusinessLog(title = "变电站基本信息_列表", opType = LogAnnotionOpTypeEnum.QUERY)
    public ResponseData list(StationParam stationParam) {
        return new SuccessResponseData(stationService.list(stationParam));
    }

    /**
     * 导出系统用户
     *
     * @author mach
     * @date 2021-08-27 09:48:02
     */
    @Permission
    @GetMapping("/station/export")
    @BusinessLog(title = "变电站基本信息_导出", opType = LogAnnotionOpTypeEnum.EXPORT)
    public void export(StationParam stationParam) {
        stationService.export(stationParam);
    }

    /**
     * 变电站基本信息列表
     *
     * @author mach
     * @date 2021-08-27 09:48:02
     */
    @Permission
    @GetMapping("/station/note")
    @BusinessLog(title = "变电站基本信息_便签", opType = LogAnnotionOpTypeEnum.QUERY)
    public ResponseData note(StationParam stationParam) {
        return new SuccessResponseData();
    }
}
