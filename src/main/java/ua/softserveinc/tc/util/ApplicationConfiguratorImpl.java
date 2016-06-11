package ua.softserveinc.tc.util;

import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Component;
import ua.softserveinc.tc.dto.ConfigurationDto;

/**
 * Created by Nestor on 04.06.2016.
 * Temporary class holding hardcoded global configuration values
 */

@Component
public class ApplicationConfiguratorImpl implements ApplicationConfigurator {

    private Integer kidsMinAge = 3;
    private Integer kidsMaxAge = 8;
    private Integer minutesToCalculateBookingsEveryDay = 15;
    private Integer hourToCalculateBookingsEveryDay = 18;
    private Integer minutesToSendEmailReport = 30;
    private Integer hourToSendEmailReport = 19;
    private Integer dayToSendEmailReport = 20;
    private Integer minPeriodSize = 15;
    private String serverName = "localhost:8080/home";

    @Override
    public ConfigurationDto getObjectDto(){
        return new ConfigurationDto(this);
    }

    @Override
    public void acceptConfiguration(ConfigurationDto cDto){
        this.kidsMinAge = cDto.getKidsMinAge();
        this.kidsMaxAge = cDto.getKidsMaxAge();
        this.minutesToCalculateBookingsEveryDay = cDto.getMinutesToCalculateBookingsEveryDay();
        this.hourToCalculateBookingsEveryDay = cDto.getHourToCalculateBookingsEveryDay();
        this.minutesToSendEmailReport = cDto.getMinutesToSendEmailReport();
        this.hourToSendEmailReport = cDto.getHourToSendEmailReport();
        this.dayToSendEmailReport = cDto.getDayToSendEmailReport();
        this.minPeriodSize = cDto.getMinPeriodSize();
        this.serverName = cDto.getServerName();
        System.out.println("??????????????????????????????????????????????????????????????????????????");

    }

    @Override
    public Integer getKidsMinAge() {
        return kidsMinAge;
    }

    @Override
    public Integer getKidsMaxAge() {
        return kidsMaxAge;
    }


    @Override
    public Integer getMinPeriodSize() {
        return minPeriodSize;
    }

    @Override
    public String getServerName() {
        return serverName;
    }

    @Override
    public int getMinutesToCalculateBookingsEveryDay() {
        return minutesToCalculateBookingsEveryDay;
    }

    @Override
    public int getHourToCalculateBookingsEveryDay() {
        return hourToCalculateBookingsEveryDay;
    }

    @Override
    public int getMinutesToSendEmailReport() {
        return minutesToSendEmailReport;
    }

    @Override
    public int getHourToSendEmailReport() {
        return hourToSendEmailReport;
    }

    @Override
    public int getDayToSendEmailReport() {
        return dayToSendEmailReport;
    }
}
