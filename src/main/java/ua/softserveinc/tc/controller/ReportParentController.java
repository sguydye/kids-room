package ua.softserveinc.tc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import ua.softserveinc.tc.constants.ModelConstants.ReportConst;
import ua.softserveinc.tc.entity.Booking;
import ua.softserveinc.tc.entity.Room;
import ua.softserveinc.tc.entity.User;
import ua.softserveinc.tc.service.BookingService;
import ua.softserveinc.tc.service.RoomService;
import ua.softserveinc.tc.service.UserService;

import java.security.Principal;
import java.util.List;

/**
 * Created by Demian on 08.05.2016.
 */
@Controller
public class ReportParentController
{
    @Autowired
    private UserService userService;

    @Autowired
    private RoomService roomService;

    @Autowired
    private BookingService bookingService;

    @RequestMapping(value = "/report-parent", method = RequestMethod.GET,
            params = {ReportConst.PARENT_EMAIL, ReportConst.DATE_THEN, ReportConst.DATE_NOW})

    public @ResponseBody ModelAndView parentBookings(Principal principal,
                                                     @RequestParam(value = ReportConst.PARENT_EMAIL) String parentEmail,
                                                     @RequestParam(value = ReportConst.DATE_THEN) String dateThen,
                                                     @RequestParam(value = ReportConst.DATE_NOW) String dateNow                                                     )
    {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName(ReportConst.PARENT_VIEW);
        ModelMap modelMap = modelAndView.getModelMap();

        User parent = userService.getUserByEmail(parentEmail);
        Room room = roomService.getRoomByManager(userService.getUserByEmail(principal.getName()));
        List<Booking> bookings = bookingService.getBookingsByUserByRoom(parent, room, dateThen, dateNow);
        Long sumTotal = bookingService.getSumTotal(bookings);

        modelMap.addAttribute(ReportConst.PARENT, parent);
        modelMap.addAttribute(ReportConst.DATE_NOW, dateNow);
        modelMap.addAttribute(ReportConst.BOOKINGS, bookings);
        modelMap.addAttribute(ReportConst.DATE_THEN, dateThen);
        modelMap.addAttribute(ReportConst.SUM_TOTAL, sumTotal);

        return modelAndView;
    }
}