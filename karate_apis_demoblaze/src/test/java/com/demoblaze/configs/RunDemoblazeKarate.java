package com.demoblaze.configs;


import com.intuit.karate.junit5.Karate;

public final class RunDemoblazeKarate {
    @Karate.Test
    Karate testDemoblaze()
    {
        return Karate.run("classpath:features/demoblaze.feature").relativeTo(getClass());
    }




}