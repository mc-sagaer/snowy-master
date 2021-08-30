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
package com.mch.modular.station.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mch.core.exception.ServiceException;
import com.mch.core.factory.PageFactory;
import com.mch.core.pojo.page.PageResult;
import com.mch.core.util.PoiUtil;
import com.mch.modular.station.entity.Station;
import com.mch.modular.station.enums.StationExceptionEnum;
import com.mch.modular.station.mapper.StationMapper;
import com.mch.modular.station.param.StationParam;
import com.mch.modular.station.service.StationService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 变电站基本信息service接口实现类
 *
 * @author mach
 * @date 2021-08-27 09:48:02
 */
@Service
public class StationServiceImpl extends ServiceImpl<StationMapper, Station> implements StationService {

    @Override
    public PageResult<Station> page(StationParam stationParam) {
        QueryWrapper<Station> queryWrapper = new QueryWrapper<>();
        if (ObjectUtil.isNotNull(stationParam)) {

            // 根据唯一资源id 查询
            if (ObjectUtil.isNotEmpty(stationParam.getObjid())) {
                queryWrapper.lambda().eq(Station::getObjid, stationParam.getObjid());
            }
            // 根据创建时间 查询
            if (ObjectUtil.isNotEmpty(stationParam.getCdate())) {
                queryWrapper.lambda().eq(Station::getCdate, stationParam.getCdate());
            }
            // 根据操作人 查询
            if (ObjectUtil.isNotEmpty(stationParam.getOperator())) {
                queryWrapper.lambda().eq(Station::getOperator, stationParam.getOperator());
            }
            // 根据操作人id 查询
            if (ObjectUtil.isNotEmpty(stationParam.getOperatorId())) {
                queryWrapper.lambda().eq(Station::getOperatorId, stationParam.getOperatorId());
            }
            // 根据省 查询
            if (ObjectUtil.isNotEmpty(stationParam.getProvince())) {
                queryWrapper.lambda().eq(Station::getProvince, stationParam.getProvince());
            }
            // 根据市 查询
            if (ObjectUtil.isNotEmpty(stationParam.getCity())) {
                queryWrapper.lambda().eq(Station::getCity, stationParam.getCity());
            }
            // 根据县 查询
            if (ObjectUtil.isNotEmpty(stationParam.getCounty())) {
                queryWrapper.lambda().eq(Station::getCounty, stationParam.getCounty());
            }
            // 根据集控中心 查询
            if (ObjectUtil.isNotEmpty(stationParam.getControlCenter())) {
                queryWrapper.lambda().eq(Station::getControlCenter, stationParam.getControlCenter());
            }
            // 根据变电站名称 查询
            if (ObjectUtil.isNotEmpty(stationParam.getStationName())) {
                queryWrapper.lambda().eq(Station::getStationName, stationParam.getStationName());
            }
            // 根据电压等级 查询
            if (ObjectUtil.isNotEmpty(stationParam.getVoltageLevel())) {
                queryWrapper.lambda().like(Station::getVoltageLevel, stationParam.getVoltageLevel());
            }
            // 根据照片 查询
            if (ObjectUtil.isNotEmpty(stationParam.getPhoto())) {
                queryWrapper.lambda().eq(Station::getPhoto, stationParam.getPhoto());
            }
        }
        return new PageResult<>(this.page(PageFactory.defaultPage(), queryWrapper));
    }

    @Override
    public List<Station> list(StationParam stationParam) {
        return this.list();
    }

    @Override
    public void add(StationParam stationParam) {
        Station station = new Station();
        BeanUtil.copyProperties(stationParam, station);
        this.save(station);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void delete(List<StationParam> stationParamList) {
        stationParamList.forEach(stationParam -> {
            this.removeById(stationParam.getId());
        });
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void edit(StationParam stationParam) {
        Station station = this.queryStation(stationParam);
        BeanUtil.copyProperties(stationParam, station);
        this.updateById(station);
    }

    @Override
    public Station detail(StationParam stationParam) {
        return this.queryStation(stationParam);
    }

    /**
     * 获取变电站基本信息
     *
     * @author mach
     * @date 2021-08-27 09:48:02
     */
    private Station queryStation(StationParam stationParam) {
        Station station = this.getById(stationParam.getId());
        if (ObjectUtil.isNull(station)) {
            throw new ServiceException(StationExceptionEnum.NOT_EXIST);
        }
        return station;
    }

    @Override
    public void export(StationParam stationParam) {
        List<Station> list = this.list(stationParam);
        PoiUtil.exportExcelWithStream("SnowyStation.xls", Station.class, list);
    }

}
