//
//  Event.swift
//  midterm_ParthAntala
//
//  Created by Parth Antala on 2022-07-08.
//

import Foundation
var eventsList = [Event]()

class Event
{
    var id: Int!
    var name: String!
    var date: Date!
    var color: String!
    func eventsForDate(date: Date) -> [Event]
    {
        var daysEvents = [Event]()
        for event in eventsList
        {
            if(Calendar.current.isDate(event.date, inSameDayAs:date))
            {
                daysEvents.append(event)
            }
        }
        return daysEvents
    }
}
