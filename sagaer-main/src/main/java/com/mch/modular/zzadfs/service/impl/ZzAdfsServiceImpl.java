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
package com.mch.modular.zzadfs.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mch.core.pojo.page.PageResult;
import com.mch.core.util.PoiUtil;
import com.mch.modular.zzadfs.entity.ZzAdfs;
import com.mch.modular.zzadfs.enums.ZzAdfsExceptionEnum;
import com.mch.modular.zzadfs.mapper.ZzAdfsMapper;
import com.mch.modular.zzadfs.param.ZzAdfsParam;
import com.mch.core.exception.ServiceException;
import com.mch.core.factory.PageFactory;
import com.mch.modular.zzadfs.service.ZzAdfsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 用户表service接口实现类
 *
 * @author mch
 * @date 2021-08-03 16:56:51
 */
@Service
public class ZzAdfsServiceImpl extends ServiceImpl<ZzAdfsMapper, ZzAdfs> implements ZzAdfsService {

    @Override
    public PageResult<ZzAdfs> page(ZzAdfsParam zzAdfsParam) {
        QueryWrapper<ZzAdfs> queryWrapper = new QueryWrapper<>();
        if (ObjectUtil.isNotNull(zzAdfsParam)) {

            // 根据姓名 查询
            if (ObjectUtil.isNotEmpty(zzAdfsParam.getName())) {
                queryWrapper.lambda().eq(ZzAdfs::getName, zzAdfsParam.getName());
            }
            // 根据性别 查询
            if (ObjectUtil.isNotEmpty(zzAdfsParam.getSex())) {
                queryWrapper.lambda().eq(ZzAdfs::getSex, zzAdfsParam.getSex());
            }
            // 根据 查询
            if (ObjectUtil.isNotEmpty(zzAdfsParam.getCompany())) {
                queryWrapper.lambda().eq(ZzAdfs::getCompany, zzAdfsParam.getCompany());
            }
        }
        return new PageResult<>(this.page(PageFactory.defaultPage(), queryWrapper));
    }

    @Override
    public List<ZzAdfs> list(ZzAdfsParam zzAdfsParam) {
        return this.list();
    }

    @Override
    public void add(ZzAdfsParam zzAdfsParam) {
        ZzAdfs zzAdfs = new ZzAdfs();
        BeanUtil.copyProperties(zzAdfsParam, zzAdfs);
        this.save(zzAdfs);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void delete(List<ZzAdfsParam> zzAdfsParamList) {
        zzAdfsParamList.forEach(zzAdfsParam -> {
            this.removeById(zzAdfsParam.getId());
        });
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void edit(ZzAdfsParam zzAdfsParam) {
        ZzAdfs zzAdfs = this.queryZzAdfs(zzAdfsParam);
        BeanUtil.copyProperties(zzAdfsParam, zzAdfs);
        this.updateById(zzAdfs);
    }

    @Override
    public ZzAdfs detail(ZzAdfsParam zzAdfsParam) {
        return this.queryZzAdfs(zzAdfsParam);
    }

    /**
     * 获取用户表
     *
     * @author mch
     * @date 2021-08-03 16:56:51
     */
    private ZzAdfs queryZzAdfs(ZzAdfsParam zzAdfsParam) {
        ZzAdfs zzAdfs = this.getById(zzAdfsParam.getId());
        if (ObjectUtil.isNull(zzAdfs)) {
            throw new ServiceException(ZzAdfsExceptionEnum.NOT_EXIST);
        }
        return zzAdfs;
    }

    @Override
    public void export(ZzAdfsParam zzAdfsParam) {
        List<ZzAdfs> list = this.list(zzAdfsParam);
        PoiUtil.exportExcelWithStream("SnowyZzAdfs.xls", ZzAdfs.class, list);
    }

}
