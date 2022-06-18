package com.povertyrelief.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.povertyrelief.entity.Donation;
import com.povertyrelief.entity.Panel;
import com.povertyrelief.entity.Result.Result;
import com.povertyrelief.service.PanelService;
import com.povertyrelief.utils.DateUtils;
import javafx.scene.layout.Pane;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 政策展板 前端控制器
 * </p>
 */
@RestController
@RequestMapping("/poverty/panel")
public class PanelController {
    @Autowired
    private PanelService panelService;

    /**
     *     private List<T> records;
     *     private long total;
     *     private long size;
     *     private long current;
     *     private String[] ascs;
     *     private String[] descs;
     *     private boolean optimizeCountSql;
     * @param panelPage
     * @return
     */
    @RequestMapping("/getTenPolicy")
    public Result getTenPolicy(Page<Panel> panelPage) {
        IPage<Panel> page = panelService.page(panelPage, null);
        return Result.ok(page);
    }
    @RequestMapping("/getAllPolicy")
    public Result getAllLoan(Page<Panel> panelPage) {
        panelPage.setSize(1000);
        IPage<Panel> page = panelService.page(panelPage, null);
        return Result.ok(page);
    }

    @RequestMapping("/selectById")
    public Result selectById(String id){
        Panel panel = panelService.getById(id);
        return Result.ok(panel);
    }

    @RequestMapping("/selectPage")
    public Result selectPage(Page<Panel> page){
        QueryWrapper<Panel> panelQueryWrapper = new QueryWrapper<>();
        panelQueryWrapper.orderByAsc("create_time");
        IPage<Panel> panelIPage = panelService.page(page, panelQueryWrapper);
        return Result.ok(panelIPage);
    }

    @RequestMapping("/insert")
    public Result insert(@RequestBody Panel panel){
        panel.setCreateTime(DateUtils.getNowDate());
        panelService.save(panel);
        return Result.ok("添加成功");
    }
    @RequestMapping("/update")
    public Result update(@RequestBody Panel panel){
//        panel.setCreateTime(DateUtils.getNowDate());
        panelService.updateById(panel);
        return Result.ok("添加成功");
    }

    @RequestMapping("/delete")
    public Result delete(String id){
        panelService.removeById(id);
        return Result.ok("删除成功");
    }

}

