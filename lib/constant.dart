import 'package:frontend/src/model/UserInfo.dart';
import 'package:flutter/material.dart';

const primaryColor = Color(0xFFFFC200);
const textColor = Color(0xFF241424);
const darkButton = Color(0xFF372930);
bool isLoggedIn = false;
UserInfo user = new UserInfo();


//String Constants
final String ABOUT_STR = "About";
final String VISION_MISSION_VALUES_STR = "Vision Mission Values";
final String PHILOSOPHY_STR = "Our Philosophy";

final String ABOUT_TEXT = "We’re an experienced Financial Trading Firm committed to helping clients strategize and invest for their future financial security. We specialize in assessing each of our client’s unique needs and creating a personalized trading plan that will work best for their interests. we have gained invaluable experience working in a variety of markets, guaranteeing you get the guidance needed to achieve investment success.";
final String VISION_MISSION_VALUES_TEXT = "We’re proud to say we’ve built a culture that stands for strong Values and a shared Vision and Mission. It’s a core part of our DNA. Our Vision is to build a future where every ambition is within reach. And we work towards that each day by creating financial solutions to move our customers and partners forward – we consider this our Mission. Our Values mark our past, inform our actions every day, and inspire our future.";
final String PHILOSOPHY_TEXT = "We will work with a fierce resolve to make this a company of which our customers, employees and communities can be proud. We cannot promise specific outcomes or risk-free results. What we can and will promise is to be truthful and give honest assessments of our businesses and prospects; act with integrity and honour, and do the right thing—not necessarily the easy or expedient thing.";