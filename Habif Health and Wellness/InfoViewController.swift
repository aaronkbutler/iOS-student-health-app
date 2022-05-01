//
//  InfoViewController.swift
//  Habif Health and Wellness
//
//  Created by Coby Drexler on 11/14/19.
//  Copyright © 2019 Aaron Butler. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var infoSections:[String] = [
        "Mental Health Services",
        "Medical and Health Care Services",
//        "Medical Promotion Services",
//        "Relationship and Sexual Violence Prevention Center"
    ]
    
    struct Info {
        let headline: String
        let mission: String
        let services: [String]
        let serviceMap: [String:InfoDetail]
    }
    
    struct InfoDetail {
        let headline: String
        let mission: String
        let subservices: [String]
        let subserviceMap: [String:String]
    }

    let mentalHealthInfo:Info = Info(
        headline: "Mental Health Services",
        mission: "Mental Health Services at Habif Health and Wellness Center is committed to providing exceptional, confidential and inclusive care for all students, with the goal of working collaboratively with students and the greater campus community to improve overall personal development and quality of life.",
        services: [
            "Counseling",
            "Eligibility for Services",
            "Making An Appointment",
            "Crisis Response",
            "Psychiatry Services",
            "Guide to Community Mental Health Services",
            "Treatment of ADHD",
            "Body Image and Disordered Eating",
            "Group Therapy Services",
            "TAO (Therapist Assisted Online)",
            "LGBTQIA+ Health",
        ],
        serviceMap: [
            "Counseling": InfoDetail(
                headline: "Counseling",
                mission: "It’s not unusual for a student to feel they “can’t cope” with something, or to wish that they had someone to talk to. Many students experience times when they are puzzled or concerned about themselves or about situations in which they find themselves. Mental Health Services staff members are here to help students with these and other personal concerns.",
                subservices: [
                    "Individual Counseling",
                    "Group Counseling",
                    "Counseling at Washington University"
                ],
                subserviceMap: [
                    "Individual Counseling": "In individual counseling, students may work privately with a counselor for a limited number of meetings. They discuss such issues as personal feelings or relationships with others and develop new ways to understand and deal with those issues. If problems center on how couples are (or are not) getting along, couples counseling may help develop new ways of relating to each other.",
                    "Group Counseling": "Group counseling may also be appropriate. Group counseling fosters active learning by working on problems rather than just talking about them. Group work provides a safe and challenging place to work on personal and interpersonal concerns.",
                    "Counseling at Washington University": """
                    We offer short-term, time-limited counseling services to facilitate adjustment, improve functioning, achieve resolution of problems, and address acute symptoms impairing personal functioning as soon as possible.\n
                    
                    Counseling services provided through MHS are not an appropriate substitute for open-ended, intensive psychological services. Some common examples of issues that may be more appropriate for off-campus treatment are:\n
                    
                    1. Student issues that require regular weekly appointments throughout the semester \n
                    2. Student concerns which require a specific type of therapy not practiced by the staff \n
                    3. Student difficulties which required open-ended, ongoing psychotherapy before coming to Washington University \n
                    4. Student issues that tend to worsen in short-term counseling \n
                    """
                ]
            ),
            "Eligibility for Services": InfoDetail(
                headline: "Eligibility for Services",
                mission: "Learn about the eligibility for different services.",
                subservices: ["Guidelines"],
                subserviceMap: [
                    "Guidelines": """
                    1. MHS provides clinical services to all full-time Washington University Danforth Campus day students who have paid the Student Health and Wellness fee. Spouses or partners of full-time students are not eligible for individual counseling or psychiatric services. Spouses or partners are eligible for couples counseling if their spouse/partner has paid the Student Health and Wellness fee. \n
                    2. Students who take an approved medical leave and have paid the Student Health and Wellness fee for the current semester may continue to be seen in MHS for that semester. Exceptions may be made for international students when services cannot be accessed in the local community in their native language, but are available at SHS. \n
                    3. Upon graduation, students are eligible to be seen until December 31st for the Fall semester and May 31st for the Spring semester. \n
                    4. During summer break, currently enrolled students are eligible to receive services regardless of credit hours, as well as continuing students who are enrolled full-time for the upcoming fall semester. \n
                    5. Consistent with its mission to provide only clinical services to students, MHS does not undertake forensic evaluations (e.g., court-ordered custody evaluations; evaluations for eligibility for disability or emotional support animals, etc.) or make forensic recommendations or provide expert testimony.
                    """
                ]
            ),
            "Making An Appointment": InfoDetail(
                headline: "Making An Appointment",
                mission: "Learn about the different aspects for making mental health services appointment.",
                subservices: ["New Appointments", "What to Expect", "Return Appointments", "Crisis Appointments", "Before Your Appointment", "Short Term Therapy"],
                subserviceMap: [
                    "New Appointments":"""
                        The first step for most students seeking mental health services is a brief, confidential phone conversation with a MHS staff member. The purpose of the conversation is to clarify and assess your needs, and explore options for next steps.\n
                    
                        The telephone assessment can be scheduled online through the SHS portal.\n
                    
                        If you would like your screening to occur face to face versus by phone, you must arrive 10 minutes early at Habif and use the kiosks to check in. The counselor will greet you in the waiting room at the scheduled time.\n
                    
                        Brief assessment phone appointments are scheduled for the same day or the next day if the request occurs late in the day and there are no more available appointments.\n
                    """,
                    "What to Expect": """
                        At the scheduled appointment time, you will receive a call from a MHS staff member for a 10-minute conversation. The staff member will ask several questions about your situation and talk with you about available options that may be appropriate for you. These might include:\n
                    
                        1. Scheduling a routine appointment with a MHS staff member\n
                        2. During periods peak demand, the waiting time will grow. If you do not wish to wait, we can help facilitate a referral to a community provider\n
                        3. Getting you into one of our MHS groups which many students have found to be supportive and effective assistance for addressing their concerns\n
                        4. Scheduling you for an urgent appointment if your need is more serious (usually within 1-3 business days)\n
                        5. Referring you to a community mental health provider. This can be a good option for students who want open-ended therapy, prefer to pursue counseling off-campus, or want to begin a counseling relationship immediately during those times of the year when immediate access to MHS may be limited due to high demand.\n

                        We rely on you to help us understand the nature and urgency of your needs. Please be as open as you can during this phone conversation.
                    """,
                    "Return Appointments": """
                        After the first appointment, follow-up appointments may also be made online. Please understand that routine appointments must be scheduled in advance in order to find a time that works for both you and your therapist or psychiatrist. Counseling return appointments can be made as far as six weeks out, and up to three counseling return appointments can be scheduled at any given time. During periods of very high demand, you may experience a delay in scheduling a return appointment. We appreciate your patience.
                    """,
                    "Crisis Appointments": """
                        In the event of a crisis, during normal business hours, please either come directly to Habif or you may call us at 314-935-6695 and identify the situation as an emergency. If you are contacting us after business hours, call 314-935-5555 if you are on campus or 911 if you are off campus.
                    """,
                    "Before Your Appointment": """
                        See your Patient Rights and Responsibilities and read the HIPAA Information to learn more about how your medical records and information are handled. Your conversations with our staff members are confidential.
                    """,
                    "Short Term Therapy": """
                        Brief counseling works best when clients are prepared to identify and clarify goals for treatment. Your therapist will collaborate with you on this task.\n
                        Be ready to do some work in sessions and between sessions. If you want to make progress, make therapy part of your life. Commit yourself to doing any homework or skills practice suggested by your counselor.\n
                        Have realistic and positive expectations for counseling.  What you get out of counseling is directly related to the effort that you put into counseling.\n
                        It’s important to note that a therapist’s role is not to “cure” or “fix,” or to provide dramatic insights (as we often see portrayed on TV). The role of a counselor is collaborative in nature. Therapist’s help students identify and clarify goals for treatment, and assist with achieving these go​als via emotional support, guidance, education, and homework assignments.\n
                        Be open to trying new ideas and skills. Clients who are not open to trying new ideas and skills are less likely to make progress because doing so amounts to ‘doing the same thing over and over’ regarding their issues.\n
                        Realize that progress does not occur on a straight line. It’s much more conducive to think of progress made in counseling as you would view the rise in the stock market or housing market over time. That is, in each of these instances there are many ‘dips’ but an overall ‘rise.’\n
                        Be honest and open with your therapist. This can be difficult, especially if you’re not used to sharing, but give it a try. It may help you to think about what you want to talk about beforehand.\n
                        Talk to your therapist about your experience of counseling. Therapists appreciate when clients talk about how therapy is working. If there are issues, you and your therapist can communicate about this and make a plan for improving how you work together.\n
                    """
                ]),
            "Crisis Response": InfoDetail(
                headline: "Crisis Response",
                mission: "Washington University is committed to responding as quickly as possible to any mental health emergency on campus.",
                subservices: [
                    "What is a Mental Health Emergency?",
                    "Emergency Contact Numbers",
                    "Recognizing Warning Signs",
                    "Listening",
                    "Expressing Concern",
                    "Making a Referral",
                    "Suicide Prevention Training"
                ],
                subserviceMap: [
                    "What is a Mental Health Emergency?": """
                    A mental health emergency is an emotional or behavioral crisis that warrants same-day or immediate attention by a mental health professional. This may include, but is not limited to, significant changes in behavior that are not characteristic of a person, the presence of disruptive symptoms that interfere with the responsibilities of daily living, direct or indirect expressions or the intent to harm self or others, or the experience of a trauma or assault. \n
                    During our business hours, if you or a WashU student you know is experiencing a mental health emergency, please either come directly to the Habif Health and Wellness Center or call us at 314-935-6666, press 0, and identify the situation as an emergency. \n
                    
                    To be connected to an on-call counselor after hours, call us at 314-935-6666 and follow the voice prompts. A crisis counselor is available after-hours and on weekends year round. \n
                    
                    For immediate intervention when Habif is closed and you are on campus, call campus police at 314-935-5555. If you are off campus, call 911 or go to the nearest emergency room.
                    """,
                    "Emergency Contact Numbers": """
                        The National Suicide Prevention Lifeline: 1-800-273-TALK (8255) \n
                        National Sexual Assault Hotline by RAINN: 1-800-656-HOPE (4673) \n
                        National Domestic Violence Hotline: 1-800-799-SAFE (7233) \n
                        Trevor Project Hotline: 1-866-488-7386 or Text “Start” to 678678 \n
                        Trans Lifeline (available 9 a.m. – 3 a.m. CST): 1-877-565-8860 \n
                        LGBTQ Partner Abuse and Sexual Assault Helpline: 1-866-356-6998 or text 804-793-9999. \n
                    """,
                    "Recognizing Warning Signs": """
                        Recognizing the warning signs of a student in distress does not require special training or expertise. It does, however, require an awareness of what to look for. A friend may not come right out and tell you that something is wrong but his/her language and behaviors often do. \n
                    
                        WITHDRAWAL\n
                        1. Shows up for an event for a while, but leaves early \n
                        2. Is “too busy” studying or surfing the web to hang out \n
                        3. Just doesn’t seem to connect well with others \n
                        4. Skips class frequently \n
                        5. Stays in room or bed all day \n
                        6. Avoids eye-contact\n
                    
                        DISTURBING SPEECH/COMMUNICATION\n
                        1. Uses language indicating intention to harm self or someone else\n
                        2. Expresses a hopeless or negative outlook\n
                        3. Blames self or others for his/her mood/behavior (“I’m just lazy…”)\n
                    
                        SIGNIFICANT CHANGES IN MOOD OR BEHAVIOR \n
                        1. Used to seem happy but now seems agitated, depressed, “checked-out” \n
                        2. May have been easy-going but now seems uptight, aggressive or “on edge” \n
                        3. Neglects personal hygiene or appearance \n
                        4. Increased use of alcohol or drugs \n
                        5. Significant weight gain or loss \n
                        6. Increased sleep or inability to sleep nearly every day \n
                        7. Decreased ability to concentrate \n
                    
                        The greater the number of warning signs present, the greater the likelihood that the student needs assistance.
                    """,
                    "Listening": """
                        Don’t be afraid to ask “What’s wrong?” or “What’s going on?” Simply asking the question won’t create a problem where there is none. Don’t underestimate the importance of listening. Without “doing” anything else, you are providing the support that could help your friend feel heard and understood (maybe for the first time). While it may be necessary or convenient to communicate electronically at times (email, text or instant messaging), if at all possible, try to listen in person where it is easier to pick up on cues from facial expressions and other nonverbal language.\n
                    
                        Effective listening requires:\n
                    
                        ATTENTIVENESS \n
                        1. Maintain eye contact. \n
                        2. Ask for clarification when you don’t understand something that has been said. \n
                        3. Lean forward with open posture to indicate interest. \n
                        ATTENTION TO VERBAL AND NONVERBAL LANGUAGE \n
                        1. Pay attention to what is said and what is not said (i.e., tone of voice, posture, hand or facial gestures). \n
                        2. Notice when the nonverbal language doesn’t match the verbal language. Point out the disparity. \n
                        ACCEPTING ATTITUDE \n
                        1. Try not to judge or discount what you are hearing. \n
                        2. Don’t say: “You shouldn’t feel that way” or “You’ll be fine.” \n
                        3. Do say: “This sounds like a tough situation.” \n
                        4. If you find yourself slipping into an advice-giving or “fix it” mode, you may not be listening. Take a breath and refocus on what your friend is saying.
                    """,
                    "Expressing Concern": """
                        It’s okay to express concern in a calm, nonjudgmental way. However, be careful not to over-react with too much emotion or panic.\n
                    
                        ACKNOWLEDGE THE STRUGGLE\n
                        You can do this by simply explaining without judgment that you are concerned.\n
                    
                        1. Do say: “I’m worried about you. It seems like you haven’t been yourself lately.”\n
                        2. Don’t say: “It seems like your life’s a mess right now.”\n
                    """,
                    "Making a Referral": """
                        Keep in mind that struggling with normal life events does not always require counseling. It is often the struggles in life that provide the most opportunity for growth. However, if the situation seems to be triggering a more severe reaction (things seem to be spiraling out of control for the student) or it has been going on for more than a couple of weeks, then a referral to counseling may be appropriate. Mental Health Services staff members are here to provide support for your friend and for you. If you would like to consult with a staff member about how to handle your concerns, call 314-935-6695 to speak to the mental health service coordinator and schedule a consultation. \n
                    
                        WHEN TO REFER\n
                        1. Review the warning signs to determine if any apply to the student (but always trust your own instincts even if there are no identifiable signs).\n
                        2. If you have immediate concerns about a student’s safety (i.e., you think he/she might cause harm to self or someone else), stay with your friend and call (on campus) Washington University Police Dept. at 314-935-5555 or when off campus, 911. If it is not a life-threatening situation but you are still concerned, accompany the student to Habif during regular business hours or call 314-935-6695. If it is after hours, call 314-935-6666 and press option #1.\n
                        3. If you are feeling overwhelmed by the student’s situation, consider talking with a counselor about how you can take care of yourself and get support.\n
                        HOW TO REFER:\n
                        1. Express concern again, “This sounds pretty difficult. There are more qualified experts who are available to help.”\n
                        2. The first step is a brief, confidential phone conversation with a MHS staff member. The purpose of the conversation is to clarify and assess needs, and explore options for next steps. The telephone assessment can be scheduled online through the Student Health Portal.\n
                        3. Commend your friend for taking this first step.
                    """,
                    "Suicide Prevention Training":"""
                        ASK LISTEN REFER is a Washington University in St. Louis suicide prevention training program designed to help faculty, staff, and students prevent suicide by teaching them to recognize the risk factors, protective factors, and warning signs of suicide, identify people at risk for suicide, and respond to and get help for people at risk.
                    """
                ]),
            "Psychiatry Services": InfoDetail(
                headline: "Psychiatry Services",
                mission: "Full-time Danforth Campus students who have paid the health and wellness fee are eligible for psychological consultation at Mental Health Services, and psychiatry services are available on an as-needed basis.",
                subservices: [
                    "About Psychiatry Services",
                    "Continuity of Care",
                    "Psychiatry Scheduling"
                ],
                subserviceMap: [
                    "About Psychiatry Services": """
                        Research shows that psychotropic medication works best in tandem with mental health counseling. In order to provide the best possible care, in most cases students gain access to MHS psychiatry services after a referral from their existing MHS counselor.\n
                    
                        Students interested in psychiatric treatment who do not have an existing MHS counselor should schedule a phone triage appointment (called a screening) with a MHS staff member. The purpose of the conversation is to clarify and assess your needs, and explore options for next steps. Use the Student Portal to schedule your screening and please note that this can take place in person if desired. Learn more about scheduling.\n
                    
                        Due to limited availability, students wishing to discuss whether psychotropic medication is right for them or to attain a medical diagnosis of a psychiatric illness should work with a member of the counseling team or an off-campus provider.\n
                    """,
                    "Continuity of Care": """
                        Students who have an ongoing relationship with a family physician or psychiatrist at home are encouraged to maintain services with these providers. This can be beneficial for continuity of care as the home provider has an established relationship with the student. To facilitate this, students schedule appointments with their home provider during school break periods (may need to schedule two to three months in advance due to typical psychiatry wait times).\n
                    
                        Please follow these instructions carefully if you are a student interested in transferring existing psychiatric care to Habif:\n
                    
                        1. Submit all psychiatric medical records for a minimum of the past five years (including any psychiatric hospitalizations and in-patient treatment).\n
                        2. Contact the Mental Health Services Coordinator at 314-935-6695 to verify that your records have been received.\n
                        Once records are on file, students are placed on the waitlist for a psychiatric appointment. Please be aware that it can take several weeks before an initial psychiatric appointment at Habif, and plan accordingly. Students are free to explore off-campus options in lieu of Habif psychiatry services.
                    """,
                    "Psychiatry Scheduling": """
                        In the interest of best serving students during periods of peak demand:\n
                    
                        1. Students wishing to transfer the management of existing psychiatric medication from a home doctor to MHS may do so until November 1 for the fall semester and April 1 for the spring semester.\n
                        2. Please note that available appointment slots may fill up several weeks in advance of these deadlines.\n
                        Due to the limited number of available psychiatry appointments, students are expected to miss class or work if needed to attend their initial psychiatry appointment at MHS. We can provide a receipt of the visit to verify attendance with professors/employers. Follow-up psychiatry appointments are scheduled via the student portal at the student’s convenience\n
                    """
                ]
            ),
            "Guide to Community Mental Health Services": InfoDetail(
                headline: "Guide to Community Mental Health Services",
                mission: "For many students, the idea of trying to find an off-campus therapist or psychiatrist can feel intimidating, especially if you are already feeling overwhelmed by other life concerns.",
                subservices: [
                    "About Community Mental Health Services",
                    "Counseling and Psychiatry Differences",
                    "Finding the Right Therapist/Psychiatrist",
                    "Scheduling an Appointment",
                    "Other Important Appointment Information",
                    "More Questions"
                ],
                subserviceMap: [
                    "About Community Mental Health Services": """
                        It can be hard to know how to start the process, and understanding your options is important. This guide is meant to provide some information and insight for students looking for off-campus mental health services and hopefully, to make this next step easier.
                    """,
                    "Counseling and Psychiatry Differences": """
                        Counseling: This is talk therapy. Counselors work with clients on strategies to overcome obstacles and personal challenges that they are facing. Sessions generally last 50 minutes and can be scheduled one time a week or adjusted to the client’s individual needs. The professional providing the counseling might have a degree as a clinical psychologist, licensed professional counselor, licensed clinical social worker, or marriage and family therapist.\n
                        Psychiatry: This is a medical doctor, a physician’s assistant or a certified registered nurse practitioner whom you may consult to see if medication may be helpful for your symptoms. In Missouri, most psychiatrists only provide medication management so it is often recommended to have a therapist as well.\n
                    """,
                    "Finding the Right Therapist/Psychiatrist": """
                        We are pleased to offer a new mental health referral database for the nearby St. Louis Community. Here you can find information about various off-campus providers. A great feature of this site is that you can add search filters such as insurance type and treatment specialization, (i.e., “depression”). The site also provides therapist bios and pictures.\n
                    
                        Students have also found the Find a Therapist feature on Psychology Today helpful. This website allows you to enter a zip code and see therapists that practice in that area.\n
                    
                        Another option is to ask your insurance provider for a list of providers accepted by your plan. You can do this by calling the 800 number on the back of your insurance card. Also, your insurance company may have a website search engine for locating providers in your plan.\n
                    
                        Please keep in mind the space is limited with counselors and particularly so with psychiatric providers. If you think you need counseling, don’t wait to begin the process! It can take time to locate a provider and get in for an appointment. Psychiatric wait lists in the community are often anywhere from one to three months. You may have to call several to see who has openings.
                    """,
                    "Scheduling an Appointment": """
                        In order to schedule an appointment, you will often have to leave a message on a confidential voicemail. Be sure to call from a quiet place, and repeat your name and phone number clearly and slowly. \n
                        You can leave a message like this: \n
                        “Hi (provider’s name). My name is ________ and I am looking for a therapist to meet with on a weekly basis and I have _________ insurance. I was hoping to find a time to meet to see if we might be a good fit to work together. If you could call me back at ___________, that would be great. Looking forward to hearing from you.” \n

                        When you speak with the provider, here are some questions to ask: \n

                        1. Are you currently accepting any new clients? \n
                        2. How soon would an appointment be available? \n
                        3. Do you still take ______insurance for payment? \n
                        4. What forms of payment do you accept? (example:
                           can I pay with my credit card?) \n
                        5. What are your policies about payment? Do I need to pay the co-payment at the first visit?
                        6. Where is your office located? What are the transportation options?
                        7. Is there anything I should be aware of?
                        8. If you are reaching out to a potential mental health provider by email, note that email is not a secure or confidential mode of communication. Avoid giving any information other than what is suggested in the phone script above. A first meeting with a provider is the time to share what you’re hoping to work on so save the details for the in-person meeting.
                    """,
                    "Other Important Appointment Information": """
                        If you do not have transportation, look for providers that are accessible by walking, biking or public transportation.\n
                    
                        If finances are tight, consider asking if any family members would be willing to help with the cost. If you are employed, check to see whether your employer has an Employee Assistance Program (EAP) that covers mental health services. Or, if your parent or guardian is employed and has access to an EAP plan, you can also see if that plan would cover therapy sessions for you.\n
                    
                        Another option to help save money is to consider asking your therapist if attending therapy bi-weekly would be appropriate (rather than weekly sessions). Additionally, some therapists or clinics might be willing to work with you on a “sliding scale fee” if you ask.\n
                    
                        After you have your first appointment, recognize that it may take a couple of visits to feel comfortable with your new therapist or psychiatrist, especially if you are going off campus after working with a Habif therapist you really liked. If it doesn’t feel like you are “clicking” with that person, don’t be afraid to tell them. They may be able to adapt to your needs or be able to suggest someone else that would fit you better.
                    """,
                    "More Questions": """
                        We’ve provided answers to some of the most common questions students have about community mental health services, but we are here to help if you need further assistance.\n
                    
                        We are pleased to have the addition of a mental health Care Manager, who can help you every step of the way in this process. Whether you would like help finding a provider, navigating insurance questions, or support in contacting potential providers, our care manager is here to help.\n
                    
                        Should you be interested in seeking support from our care manager, please call our office at 314-935-6695. During the call, specify that you would like assistance with off-campus services, and the staff member will help you get connected with our mental health care manager.
                    """
                ]
            ),
            "Treatment of ADHD": InfoDetail(
                headline: "ADHD Treatment",
                mission: """
                    For students wishing to receive medical treatment of ADHD at MHS:\n
                    Start by submitting your ADHD medical documentation to MHS. This must be done before an ADHD appointment can be scheduled. Documentation should include a comprehensive psychological assessment (handwritten notes are not acceptable).\n

                    While MHS does not provide the full neuropsychological testing needed for a diagnosis of ADHD, we can provide contact information of local area providers that provide this service. Call 314-935-6695 for assistance.
                """,
                subservices: [
                    "ADHD Documentation Requirements",
                    "Assessing Attention Deficit Disorder"
                ], subserviceMap: [
                    "ADHD Documentation Requirements": """
                        To receive ADHD care at Washington University, you must have the following documentation on file. \n
                    
                        EITHER full neuropsychological testing supporting the diagnosis (required to be considered for disability accommodations) OR a comprehensive evaluation reporting the following, where appropriate (please note that progress notes alone are not sufficient): \n
                    
                        History of onset of the diagnosis \n
                        Copies of methodologies used to determine the diagnosis, such as limited psychological testing, observer information from parents/adults documenting past and current symptoms in two or more settings (e.g., TOVA, Conners checklist, Vanderbilt checklist)\n
                        Assessment of possible comorbid diagnoses including learning disorders, mood disorders, anxiety disorders and substance abuse disorders \n
                        Diagnostic statement \n
                        If medications have been prescribed, a record of this must also be provided \n
                        Description of the current functional limitations of the disabling condition as they relate to the major life activity impacted by the diagnosis \n
                        Suggested accommodations (if requested)
                    """,
                    "Assessing Attention Deficit Disorder": """
                        The diagnosis of ADD/ADHD is not necessarily an easy process. The symptoms of Attention Deficit Disorder co-occur and overlap with many other problems such as depression, anxiety, sleep disorders and general stress. Habif follows a comprehensive diagnostic approach to the assessment and treatment of students with ADD/ADHD. One step in the appropriate assessment of ADD includes the review of symptoms that you are experiencing now as well as what you have experienced in the past. \n
                    
                        Because stimulant medication is one of the most often abused medications on college campuses, Habif psychiatrists will not write prescriptions without a definitive diagnosis of ADD/ADHD. In many cases, a definitive diagnosis cannot be made without proper psychological testing. \n
                    
                        For students who have been previously diagnosed and treated for ADD/ADHD, your medical records including past psychological testing will be reviewed by a psychiatrist prior to your appointment time. Before an evaluation can be scheduled, Habif must receive your records. It is the student’s responsibility to bring these records to Habif or verify that the records have been received. \n
                    
                        For students who have never been diagnosed with ADD/ADHD, Habif psychiatrists require that comprehensive psychological testing be completed prior to the initial evaluation appointment. A copy of the testing results from the evaluating psychologist must be received before an initial evaluation can be scheduled with a Habif psychiatrist. It is the student’s responsibility to verify that these records have been received by SHS. \n
                    
                        In order to maintain the availability of quality psychiatric services for students with immediate mental health needs/crises, Habif does not provide testing services for the diagnosis of ADD/ADHD. For further referral information to testing services in the St. Louis community, please call 314-935-6695. \n
                    
                        In the interest of best serving students during periods of peak demand, students wishing to be evaluated for Attention Deficit/Hyperactive Disorder (ADHD) may only schedule assessments until November 1 for the fall semester and April 1 for the spring semester. Please note that available appointment slots may fill up several weeks in advance of these deadlines. \n
                    
                        Please contact Mental Health Services at 314-935-6695 if you have any further questions.
                    """
                ]
            ),
            "Body Image and Disordered Eating": InfoDetail(
                headline: "Body Image and Disordered Eating",
                mission: "Body image is how you perceive yourself in your mind and how you see yourself reflected in the mirror. It’s how you feel about your height, shape, and weight; how you feel in your body. Not all body images are positive, and some can have significant impacts on your mood and behavior.",
                subservices: [
                    "A Healthy Body Image",
                    "What is an eating disorder?",
                    "Treatments for Eating Disorders",
                    "Helping someone who may have an eating disorders",
                    "More eating disorder help"
                ], subserviceMap: [
                    "A Healthy Body Image": """
                        An individual with a healthy body image thinks of him or herself as a whole person, considering character, friendliness, intelligence, skills and feelings. When trying to maintain a healthy body image, or retrain an unhealthy image:\n
                    
                        1. Focus on goals and strengths that go beyond your appearance.\n
                        2. Refuse to spend an unreasonable amount of time worrying about food, weight and calories.\n
                        3. Spend less time in front of mirrors.\n
                        4. Exercise for the joy of feeling your body move and grow stronger.\n
                        5. List your good qualities.\n
                        6. Get to know people beyond physical appearances. Admire unique qualities in individuals.\n
                        7. Surround yourself with people and things that make you feel good about yourself and your abilities.\n
                        8. Consider the media’s portrayal of beauty standards critically.\n
                        9. Celebrate and appreciate your natural body shape.\n
                        10. Admire parts of your body for their functions and how they make you feel.\n
                        11. Enjoy meals with friends or family members.\n
                        12. A healthy body image can also be created when an individual sets a goal to improve his or her health, energy, appearance and mood, instead of trying to maintain a certain size or shape. When adapting a body image to these new goals, it’s important to:\n
                    
                        Recognize negative outside pressures: Advertisements can trick you into creating a negative body image to sell you products or services. Your friends and family may be buying into this commercial and pop culture and they may influence your thoughts and views.\n
                        Notice when you feel negative about your body: The first step is to notice your negative thoughts. Then, you can take further steps to challenge and modify those thoughts.\n
                        Accept your natural size: If you incorporate healthy eating habits and physical activity, your body can reach a healthy weight naturally.\n
                        Allow time for change: Developing a healthy body image takes time because body attitudes can be powerful and deep. Take time to appreciate your body one part at a time.\n
                        Use different measures: The scale and the size you wear are not always good ways to rate yourself. Instead, think of what your body does for you and the activities that you can do to feel and look healthy.
                    """,
                    "What is an eating disorder?": """
                        Eating disorders are extreme expressions of a range of weight and food issues experienced by both men and women. They include anorexia nervosa, bulimia nervosa and binge eating. All are serious emotional problems that can have life-threatening consequences. All eating disorders require professional help.\n
                    
                        Eating disorders arise from a combination of psychological, interpersonal and social conditions. Feelings of inadequacy, depression, anxiety and loneliness, as well as troubled family and personal relationships, may contribute to the development of an eating disorder. Our culture, with its unrelenting idealization of thinness and the “perfect body,” is often a contributing factor. Sometimes, people try to cope with painful emotions and feelings of loss of control by dieting, bingeing and purging, but these behaviors undermine physical health, self-esteem, and a sense of competence and control.\n
                    
                        SYMPTOMS OF EATING DISORDERS\n
                        Anorexia nervosa is an eating disorder characterized by self-starvation and excessive weight loss. Symptoms vary, but can include:\n
                    
                        1. Refusal to maintain body weight at or above a minimally normal weight for height, body type, age and activity level.\n
                        2. Intense fear of weight gain and being “fat”\n
                        3. Feeling fat or overweight despite dramatic weight loss\n
                        4. Loss of menstrual periods\n
                        5. Extreme concern with body weight and shape\n
                        Bulimia nervosa is characterized by a secretive cycle of binge eating followed by purging. Symptoms can include:
                    
                        1. Binge eating: eating, in a discrete period of time (e.g., within any 2-hour period), an amount of food that is larger than most people would eat during a similar period of time, accompanied by a sense of lack of control over one’s eating during the episode, and by eating beyond the point of comfortable fullness.\n
                        2. Purging: recurrent, inappropriate compensatory behavior in order to prevent weight gain, such as self-induced vomiting, misuse of laxatives, diuretics, enemas or other medications, fasting or excessive exercise\n
                        3. Extreme concern with body weight and shape\n
                        Binge-eating disorder (also known as compulsive overeating) is characterized primarily by periods of uncontrolled, impulsive or continuous eating beyond the point of feeling comfortably full. While there is no purging, there may be sporadic fasts or repetitive diets, and often feelings of shame or self-hatred after a binge. Body weight may vary from normal to mild, moderate or severe obesity.\n
                    
                        Other eating disorders can include some combination of the signs and symptoms of anorexia, bulimia, and binge-eating disorder. While these behaviors may not be clinically diagnosed as a full-syndrome eating disorder, they can still be physically dangerous and emotionally draining.\n
                    
                        WARNING SIGNS THAT SOMEONE MAY HAVE AN EATING DISORDER\n
                        1. A marked increase or decrease in weight not related to a medical condition.\n
                        2. The development of abnormal eating habits such as severe dieting, preference for strange foods, withdrawn or ritualized behavior at mealtime, or secretive bingeing.\n
                        3. An intense preoccupation with weight and body image.\n
                        4. Compulsive or excessive exercising.\n
                        5. Self-induced vomiting, periods of fasting, or laxative, diet pill, or diuretic abuse.\n
                        6. Feelings of isolation, depression or irritability.\n
                    """,
                    "Treatments for Eating Disorders": """
                        When students first come to talk about eating and body image concerns, they usually meet with a member of the counseling staff. The counselor will help clarify the student’s concerns and may recommend that the student meet with other members of the treatment team in order to receive more comprehensive care and support.\n
                    
                        After their initial appointment, students with eating and body image concerns may meet with one or more of the treatment team for ongoing care. The eating disorders treatment team is comprised of a medical doctor, a psychiatrist, counselors, a dietician and a nurse. Our counselors can help students better understand the emotional and relational aspects of their eating and body image concerns, as well as the impact it has on their academic and social lives. If concerns about physical health arise, students may meet with the nurse and physician. Students are often referred to our dietitian to develop a healthy eating plan. Finally, our psychiatrist can evaluate whether medication could help alleviate symptoms.\n
                    
                        MAKING AN APPOINTMENT\n
                        To make an appointment with a professional from the Eating Disorders Treatment Team, please schedule online through the Student Portal. The mental health coordinator will ask you some question in order to connect you with the appropriate professional for your first visit. Subsequent visits can be scheduled online.\n
                    
                        EATING DISORDERS TREATMENT TEAM\n
                        The Habif Health and Wellness Center staff takes a comprehensive approach to evaluating and responding to students’ eating and body image concerns. Our team includes professionals who have particular experience and interest in this area. This includes counselors, nurses, a dietitian, and a physician.
                    """,
                    "Helping someone who may have an eating disorders": """
                        Set a time to talk: Set aside a time for a private, respectful meeting with your friend to discuss your concerns openly and honestly in a caring, supportive way. Make sure you will be away from distractions. Realize that you may be rejected; people with eating disorders often deny their problem. If this happens, don’t take it personally. Take your concern to a trusted adult or medical professional immediately.\n
                        Communicate your concerns: Share your memories of specific times when you felt concerned about your friend’s eating or exercise behaviors. Explain that you think these things may indicate that there could be a problem that needs professional attention.\n
                        Suggest professional help: Ask your friend to explore these concerns with a counselor, doctor, dietitian, or other health professional who is knowledgeable about eating issues. If you feel comfortable doing so, offer to help your friend make an appointment or accompany your friend on the first visit.\n
                        Avoid conflicts or a battle of the wills: If your friend refuses to acknowledge that there is a problem, or any reason for you to be concerned, restate your feelings and the reasons for them and leave yourself open and available as a supportive listener.\n
                        Avoid placing blame: Don’t place shame, blame, or guilt on your friend regarding their actions or attitudes. Do not use accusatory “you” statements like “you just need to eat” or “you are acting irresponsibly.” Instead, use “I” statements such as “I am concerned about you because you refuse to eat breakfast or lunch” or “it makes me afraid to hear you vomiting.”\n
                        Don’t reduce: Avoid giving simple solutions such as “If you’d just stop, then everything would be fine!”\n
                        Know your limits: Don’t take on the role of counselor or food monitor; it is important for you to maintain appropriate boundaries.\n
                        Express your continued support: Remind your friend that you care and want your friend to be healthy and happy.
                    """,
                    "More eating disorder help": """
                        Uncle Joe’s Peer Counseling and Resource Center has a 24-hour hotline at 314-935-5099. If you wish to speak with someone in person, their office is in the basement of Gregg Hall, 10 p.m.-1 a.m. nightly.\n
                        You can request an educational program on eating disorders and body image from the Reflections student group.
                        The National Eating Disorders Association provides information and resources about eating disorders.\n
                        Screening for Mental Health has information on self-evaluation for an eating disorder, as well as other mental health resources.
                    """
                ]
            ),
            "Group Therapy Services": InfoDetail(
                headline: "Group Therapy Services",
                mission: """
                    We currently offer several therapy groups and workshops throughout the year for our students. \n

                    Some of our groups allow for students to drop-in throughout the semester as their schedule permits, and others require students to commit to attend for the course of the semester. A few groups are held at Habif Health and Wellness Center itself, however many are held at various locations on campus as to allow easy access for members. Groups are currently offered at no additional cost to students and are available to both graduate and undergraduate students.
                """,
                subservices: [
                    "Getting Started",
                    "What is group therapy?",
                    "What do I talk about?",
                    "Types of Groups Offered"
                ], subserviceMap: [
                    "Getting Started": """
                        The first step for most students seeking MHS services is a brief, confidential phone conversation with a MHS staff member. The purpose of the conversation is to clarify and assess your needs, and explore options for next steps, which may include a recommendation to participle in our groups program as a first step of service. You may also directly request group services in your phone conversation. After your phone conversation you may be referred to a brief group orientation with one of our therapy group leaders. \n
                    
                        This telephone assessment can be scheduled online through the SHS portal.
                    """,
                    "What is group therapy?": """
                        Group therapy is a powerful medium for growth and change. In group therapy, individuals meet face to face to share their concerns with the facilitation of trained psychotherapists. The power of group therapy lies in the opportunity to receive multiple perspectives, support, encouragement, and feedback from other individuals in a safe and confidential environment. Group therapy can be a supportive place to experiment with new ideas and ways of being. For many emotional concerns, personal struggles, and relationship issues that college students face, group therapy is the most effective treatment modality. Therefore, Habif Health and Wellness Center offers specific groups to address the needs of our student community.\n
                    
                        A group typically consists of 6 to 10 people and one or more trained group therapists. Group is confidential, and what is talked about or disclosed in the group is not discussed outside the group. All groups are led by members of the Mental Health Services staff.\n
                    
                        For these and other reasons, groups are often as or more effective and efficient than individual work.
                    """,
                    "What do I talk about?": """
                        Being vulnerable and sharing information about yourself in a group setting can feel really scary. However, we know that groups can be very powerful in allowing us to feel understood, connected to others and improve mental wellbeing. You can always start with what has brought you to the group. You can let the group know what you want and can ask for both support and feedback. Relationship difficulties often improve when people express their feelings more effectively. What you share with the group will impact what you get out of the group experience. It is also important to remember that you control what, how much and when you share in group. Therapists and group members work together to establish trust so that people can talk openly and honestly.\n
                    
                        We feel confident that group therapy is one of the most effective and beneficial treatments to address the common issues faced by our students, but we understand that for some, the idea of joining a therapy group can be daunting. Although some students are initially intimidated and hesitant about participating in group therapy, group members consistently describe group therapy as a very helpful and positive experience.
                    """,
                    "Types of Groups Offered": """
                        1. Stress & Anxiety Toolkit\n
                        This group teaches skills in mindfulness, relaxation techniques, Acceptance and Commitment Therapy (ACT) to manage stress, anxiety, and depression.\n
                    
                        Wednesdays, 4:00-4:50 p.m.\n
                        DUC 245\n
                        E-mail susan.rosse@wustl.edu for more information.\n\n
                        2. Doing Better Today\n
                        This is a weekly drop-in class focused on increasing mindfulness, managing stress, and having better relationships.\n
                    
                        Tuesdays, 4:00-5:00 p.m.\n
                        DUC 242\n
                        E-mail jdyer@wustl.edu for more information.\n\n
                        3. Guided Meditation\n
                    Guided meditation session to help you train your attention and focus,  manage your stress, and root yourself in the present moment.\n
                    
                    Mondays, 4:00-4:30 p.m.\n
                    Sumers Recreation Center, Zenker Wellness Suite\n
                    E-mail  jworthington@wustl.edu for more information.\n\n
                        4. International CHAT\n
                    Gathering for international graduate students to discuss adjusting to a different culture, time and stress management, and cultivating meaningful relationships.\n
                    
                    Tuesdays, 3:40-4:55 p.m.\n
                    Liberman Graduate Center, Small Conference Room\n
                    E-mail  ciloue.c.stewart@wustl.edu for more information.\n\n
                        5. Lavendar Circle\n
                    A safe and affirming space for students navigating issues related to sexual and/or gender identity exploration and acceptance.\n
                    
                    Fridays, 1:15-2:45 p.m.\n
                    Center for Diversity and Inclusion, Multipurpose Room\n
                    E-mail  aditiahlawat@wustl.edu for more information.\n\n
                        6. Making Peace with the Mirror\n
                    Open support group for students struggling with issues related to eating, weight, and body image.\n
                    
                    Wednesdays, 3:00-4:00 p.m.\n
                    Habif Classroom\n
                    E-mail  chelsea.albus@wustl.edu for more information.\n\n
                        7. ACT Skills Group\n
                    Workshop to help you tame anxiety through developing mindfulness skills and psychological flexibility. We’ll focus on learning to accept internal experiences rather than control them.\n
                    
                    Tuesdays, 4:00-4:50 p.m.\n
                    DUC 245\n
                    E-mail susan.rosse@wustl.edu for more information.\n\n
                        8. Dissertation Support Group\n
                    Find support while writing your dissertation. Explore how to move past obstacles such as procrastination, low motivation, and social isolation.\n
                    
                    Fridays, 3:15-4:45 p.m.\n
                    Seigle Hall, Suite 435, Room 429\n
                    E-mail karolynsenter@wustl.edu for more information.\n\n
                        9. Doing Better Today\n
                    Weekly class where we focus on increasing mindfulness, managing stress, and having better relationships.\n
                    
                    Fridays, 1:15-2:45 p.m.\n
                    DUC 242\n
                    E-mail jdyer@wustl.edu for more information.\n\n
                        10. Living with Loss\n
                    Weekly closed group providing support for students grieving the loss of a loved one. In this group, you’ll share your experiences and learn coping strategies with the help of two professionals.\n
                    
                    Fridays, 2:00-3:30 p.m.\n
                    Habif Classroom\n
                    E-mail leiyujia@wustl.edu or chelsea.albus@wustl.edu for more information.\n\n
                        11. Mindfulness Bootcamp\n
                    Learn how to kickstart meditation practice and use mindfulness as a tool to deal with intense emotions.\n
                    
                    Times vary throughout the semester\n
                    Sumers Recreation Center, Zenker Wellness Suite\n
                    E-mail jworthington@wustl.edu for more information.\n\n
                        12. Small Steps, Big Rewards\n
                    Therapy group for students in recovery from substance use.\n
                    
                    Wednesdays, 4:00-5:30 p.m.\n
                    The Village House\n
                    E-mail antonina@wustl.edu or kmiserocchi@wustl.edu for more information.\n\n
                        13. Understanding Self & Others: Undergrads\n
                    A confidential group for students to meet together and work through a safe and supportive environment that will allow you to practice new ways of relating to others, gain a better understanding of yourself, share personal experiences, express fears or worries, and receive support.\n
                    
                    Mondays, 3:00-4:30 p.m.\n
                    Habif Classroom\n
                    E-mail aditiahlawat@wustl.edu for more information.\n\n
                        14. Understanding Self & Others: Grads\n
                    A confidential and supportive environment that will allow you to practice new ways fo relating to others, gain a better understanding of yourself, share personal experiences, express fears or worries, and receive support and feedback.\n
                    
                    Thursdays, 3:00-4:30 p.m.\n
                    Seigle Hall, Room 435\n
                    E-mail aditiahlawat@wustl.edu for more information.
                    """
                ]
            ),
            "TAO (Therapist Assisted Online)": InfoDetail(
                headline: "TAO (Therapist Assisted Online)", mission: "TAO is a seven-to-nine-week, interactive, web-based program that provides well-researched and highly effective strategies to help overcome anxiety, depression and other common concerns.",
                subservices: [
                    "About TAO",
                    "TAO Self-Help",
                    "Tao With Therapy"
                ], subserviceMap: [
                    "About TAO": """
                        TAO allows you to get effective treatment when your schedule, or life, makes it hard to get to a regular counseling session.
                    
                        With TAO, you will have access to highly effective therapy modules 24/7 and a dedicated time to meet online with your counselor each week. The most recent research shows this treatment model with effect sizes equal to or exceeding face-to-face therapy.
                    
                        Each week, you will watch engaging videos, complete exercises, and meet with a counselor in person or via private, secure videoconferencing for a 20-30 minute consultation.
                    
                        Weekly exercises take approximately 30-40 minutes to complete and can be done on a smart phone, tablet, or computer. These take about one to two minutes per entry and the treatment is most effective if you make an entry two or more times per day.
                    """,
                    "TAO Self-Help": """
                        You can enroll online at TAO’s self-help website using your WashU email address and agreeing to receive TAO services.
                    """,
                    "Tao With Therapy": """
                        Students interested in TAO with therapy can contact us to schedule a TAO screening appointment.
                    
                        If you are already seeing a counselor, you can let your counselor know that you are interested in TAO.
                    
                        If you would like your screening to occur in person versus by phone, you must arrive 10 minutes early at Habif and use the kiosks to check in.
                    """
                ]
            ),
            "LGBTQIA+ Health": InfoDetail(
                headline: "LGBTQIA+ Health",
                mission: "Habif Health and Wellness Center is passionate about providing high quality ​​services in a caring environment that is affirming of all​ sexual orientations and gender identities.",
                subservices: [
                    "Personal Gender Pronouns and Chosen Names",
                    "Full Legal Name",
                    "Sex used for Medical Visits",
                    "Ongoing Training",
                    "Mental Health Services",
                    "Primary Care Services",
                    "Health Promotion Services"
                ],
                subserviceMap: [
                    "Personal Gender Pronouns and Chosen Names": """
                    We strive to honor the identities of students by using personal gender pronouns (PGP) and chosen names. Students can add or change their chosen name in WebSTAC. Once this is done the information will flow into the Habif system, and we use will your chosen name while caring for you. If you have not yet added your name into WebSTAC, please let us know during your first visit to Habif.
                    
                    Your legal name and sex assigned at birth are required, however, for certain medical​ documents.
                    """,
                    "Full Legal Name": """
                        Habif Health and Wellness Center must have your legal name on all medical documents because they are legal documents. Habif will have a place holder in your medical record for your preferred name. We will need to identify you by your legal name on certain occasions during your visit but will use your preferred name when possible.
                    """,
                    "Sex used for Medical Visits": """
                        A person’s birth sex is a primary state of anatomic or physiologic parameters. Physiological change is different between the male and female sex. Medical conditions between males and females are often different between the two sexes and may require different forms of treatment. Some lab values are also reported differently between the sexes. Habif will recognize your preferred gender but will use your sex for your legal medical document and treatments.
                    """,
                    "Ongoing Training": """
                        In order to provide the best care possible, Habif clinicians participate in ongoing training in caring for LGBTQIA students including Safe Zones, Metro Trans Umbrella Group and the Transgender Spectrum Conference​.
                    """,
                    "Mental Health Services": """
                    To care for the mental health and well-being of our students, we provide a variety of services including counseling and psychiatry, couples counseling (MHS clinicians are fluent in polyamory and are welcoming of all types of relationships),  group counseling, the Let’s Talk program and TAO.\n
                    
                    Our clinicians provide a safe and confidential space for students to explore identity, gender, sexuality, intersectionality, relationships, coming out and more. Learn how to schedule your first appointment.\n
                    
                    If you have any questions about our services, please contact Jenny King at 314-935-6695.
                    """,
                    "Primary Care Services": """
                        PREVENTIVE CARE\n
                        Routine physicals, pap smears, immunizations available by appointment\n
                    
                        ACUTE EPISODIC CARE\n
                        Same-day appointments or walk-in for urgent medical illnesses/injuries\n
                    
                        STI SCREENING\n
                        Available by appointment at Habif; off-campus screenings available at the SPOT\n

                        PREP\n
                        Providers at Habif will evaluate and follow patients who are at increased risk for HIV. Book an appointment with your provider to discuss pre-exposure prophylaxis.
                    """,
                    "Health Promotion Services": """
                        1. Fliers and handouts in Habif Center waiting area and Zenker Wellness Suite in Sumers Recreation Center\n
                        2. Safer Sex supplies available in exam rooms, waiting area and at the Zenker Wellness Suite in Sumers Recreation Center\n
                        3. Free STI screening clinic once/semester in the DUC\n
                        4. LGBTQIA Sex in the Dark once/year\n
                        5. Various health promotion events​ throughout the year, e.g., “Queering Mental Health” in conjunction with OPEN, SafeZones and Pride
                    """
                ]
            )
        ]
    )

    let MedicalAndHealthCareServices: Info = Info(
        headline: "Medical and Health Care Services", mission: "Habif Health and Wellness Center Medical Services provides care for the evaluation and treatment of an illness or injury, preventative health care and health education.",
        services: [
            "Visiting Habif Health and Wellness Center",
            "Medical and Health Care Appointments",
            "Fees for Habif Health and Wellness Center"
        ], serviceMap: [
            "Visiting Habif Health and Wellness Center": InfoDetail(
                headline: "Visiting Habif Health and Wellness Center",
                mission: "Learn about the opputunites for booking appointments at the Habif Health and Wellness Center",
                subservices: [
                    "About",
                    "Schedule"
                ], subserviceMap: [
                    "About": """
                        Habif Health and Wellness Center uses Student Portal, an integrated method for students to schedule, cancel or reschedule an appointment. Next-day medical appointments open up all night long after 6 p.m. If you don’t see a next-day appointment available at first glance, check back during the evening when more appointments open up each hour.\n
                    
                        Online appointments via Student Portal are recommended for the most efficient service. ​You may also make an appointment by calling 314-935-6666.\n
                    
                        If you are in need of more immediate medical attention, you can come directly to the Habif Health and Wellness Center for a nursing evaluation.\n
                    
                        Make sure you understand the appointment process and that you come prepared for your appointment.
                    """,
                    "Schedule": """
                        Office Hours \n
                        Mon-Thurs: 8AM - 6PM\n
                        Fri: 9AM - 5PM\n
                        Sat: 9AM - 1PM (Medical urgent care only)\n
                        Sun: Closed\n
                    
                        Pharmacy Hours \n
                        Mon - Wed: 9AM - 5:30PM \n
                        Thurs - Fri: 9AM - 5PM \n
                        Sat - Sun: Closed \n
                    
                        Office Location \n
                        Nathan Dardick House, lower level \n
                    
                        Email: aldaugherty@wustl.edu \n
                        Phone: 314-935-6666 \n
                    """
                ]
            ),
            "Medical and Health Care Appointments": InfoDetail(
                headline: "Medical and Health Care Appointments",
                mission: "Learn about medical and health care appointments",
                subservices: [
                    "Making an Appointment Online",
                    "Same-Day Medical Appointments",
                    "Nutrition Appointments",
                    "About Your Appointment",
                    "Canceling an Appointment",
                    "What to Do when Habif is Closed"
                ], subserviceMap: [
                    "Making an Appointment Online": """
                    Habif Health and Wellness Center uses Student Portal, an integrated method for students to schedule, cancel or reschedule an appointment. Online appointments via Student Portal are recommended for the most efficient service.\n
                    
                    Next-day medical appointments open up all night long after 6 p.m.  If you don’t see a next-day appointment available at first glance, check back during the evening when more appointments open up each hour.
                    """,
                    "Same-Day Medical Appointments": """
                    We often have same-day appointments online. If you do not see one available, and you are in need of more immediate medical attention, please call 314-935-6666 during regular hours or come directly to Habif for a nursing evaluation.
                    """,
                    "Nutrition Appointments": """
                    Nutrition services are available by appointment online. Students can meet with a dietitian to talk about a variety of nutritional needs, including weight management, food allergies, diabetes management, eating disorders and nutrition for performance. Before your appointment, keep a food journal of what you eat and drink for two to three days. \n
                    Schedule nutrition appointments via the Student Portal or by calling 314-935-6666, option #0.
                    """,
                    "About Your Appointment": """
                    It is important that you come prepared for your appointment and are on time.\n
                    
                    1. Bring a list of any medications you are currently taking and any known food or drug allergies.\n
                    2. Arrive at least 10 minutes early.\n
                    3. Appointments may be forfeited if you are more than 15 minutes late.\n
                    4. Use the self-check-in station when you arrive.\n
                    5. Depending on the nature of your visit, there may be a fee or co-pay. Check the fee schedule to see what the charge will be for your appointment.
                    """,
                    "Canceling an Appointment": """
                    If you cannot keep an appointment, please cancel so another student may use that time.\n
                    
                    Use the Student Portal to cancel and/or reschedule your appointment 24 hours prior to your originally scheduled appointment time.\n
                    
                    Please note, a $20 fee will be billed to your Student Account for all missed appointments. If you do not plan to keep your appointment, please cancel as early as possible.
                    """,
                    "What to Do when Habif is Closed": """
                    A health care provider is always available by phone for urgent conditions when Habif is closed. To discuss a concern, call 314-935-6666, and follow the prompts.\n
                    
                    These providers do not have access to the scheduling system or information from your personal medical record. Please do not call this line for routine appointments or test results.
                    """
                ]
            ),
            "Fees for Habif Health and Wellness Center": InfoDetail(
                headline: "Fees for Habif Health and Wellness Center",
                mission: "Habif Health and Wellness Center is committed to providing the highest quality of care at a reasonable cost to students. Charges will be based on the co-pay and co-insurance your insurance policy indicates.",
                subservices: [
                    "About",
                    "Pre-Certification Requirements",
                    "Referral Requirements",
                    "Fee Schedule",
                    "Billing Procedures",
                    "Billing Questions"
                ],
                subserviceMap: [
                    "About": """
                    Habif Health and Wellness Center will collect any money due by the student in the form of a co-pay as indicated on their health insurance card at the time of service. Within 2-3 business days Habif will bill all appropriate charges to a student’s health insurance carrier. The student will be billed for any patient responsibility once payment is received from the carrier. This bill will go to the address the student indicates as their “LOCAL” address in Webstac. Failure to pay a balance due within 30 days of that statement will result in outstanding charges being placed on the student’s accounting statement and the student will owe the money via their university student bill.\n
                    
                    The missed appointment fee of $20 is the responsibility of the student payable by the student; it is not sent to the insurance company.\n
                    
                    Students may wish to pay for their services and not have their health insurance company billed. This is the student’s choice and must be discussed the day of service. Students wishing to pay for their services may do so via cash, credit card, check or charging to their student account.\n
                    
                    Consultations with the triage nurse and health education visits are provided at no cost.\n
                    
                    Habif staff is not able to determine what your insurance company will reimburse. Healthcare decisions are important decisions and should not be made solely on financial costs; therefore, these decisions should be discussed with your provider.
                    """,
                    "Pre-Certification Requirements": """
                        Pre-certification for office visits and any diagnostic tests or hospitalization are the responsibility of the student. Habif will help you with the pre-certification process once a determination has been made by the student that it is required.
                    """,
                    "Referral Requirements": """
                    Habif Health and Wellness Center provides a referral for each student when this office refers to an outside medical provider or service. Referrals are not necessary for mental health care off campus. The student is responsible for retaining the referral slip and providing it to any physician office or service for insurance billing purposes. This is separate from the pre-certification process.\n
                    
                    Students on the student health insurance plan require a referral for all medical services within a 50 mile radius of St. Louis unless it is an emergency.\n
                    
                    If you have questions please call the phone number on the back of your insurance card.
                    """,
                    "Fee Schedule": """
                    1. Allergy Injection \n
                    This is not billable to the student’s insurance company.\n
                    
                    A fee for allergy injections is charged at the time of the appointment. The fee schedule is updated yearly. This will be discussed at the time of your screening with our nurse. \n
                    
                    2. Counseling Visits
                    Visits 1-9 have no costs to the student (psychiatry appointments excluded). Visits 10-15 will have a copay as determined by the student’s insurance company, may require pre-certification, and will be billed to the student’s insurance company.\n
                    
                    3. Gynecology Procedures
                    IUD insertion and removals may require pre-certification. Services will be provided and billed to the student’s insurance company.\n
                    
                    4. Radiology
                    Radiology Services are available at Habif and the cost per X-ray varies. Charges will be billed to the respective insurance plan.\n
                    
                    5. Immunizations
                    Habif provides the following immunizations. Charges are billed to the student’s insurance plan.\n
                    
                        Hepatitis A \n
                        Hepatitis B \n
                        Menactra \n
                        Measles Mumps Rubella \n
                        Flu Vaccine \n
                        Human Papilloma Virus \n
                        Tetanus/Diphtheria/Pertussis \n
                        Meningitis B \n
                    
                    6. No Cost Resources
                    Mental Health Services provides nine free one-hour counseling sessions per academic year\n
                    Stress management consultations\n
                    Emotional support and skills groups and workshops\n
                    Stressbusters program (free five-minute back rubs at events on campus) and the Stressbusters Wellness App\n
                    Individual appointments with a specialist for complete alcohol and other drug counseling and referral, help meeting court requirements, and smoking cessation including nicotine replacement and oral medication\n
                    Sexual health resources (condoms, dams, lubricant, pregnancy tests and information for healthy sexual decision making) and consultations\n
                    Sexual assault risk reduction and survivor support (information and referrals)\n
                    Resource library, brochures, books and handouts on a variety of health and wellness topics\n
                    Student Health 101 website with customized information about health-related concerns and efforts on campus\n
                    Health Education programs led by Peer Health Educators and/or Habif staff\n
                    Zenker Wellness Suite in Sumers Recreation Center (health promotion resources and programs)
                    """,
                    "Billing Procedures": """
                    Your insurance company is billed for: provider visits, vaccines, lab tests, medical supplies, X-rays, etc.\n
                    
                    They send a document (EOB) explaining their payment procedures to the subscriber.\n
                    
                    If you have the school’s insurance, you are the subscriber of that plan and you will receive this document.\n
                    
                    If you are on your parent’s insurance plan, your parent is the subscriber of that plan. Your parent may be notified by the insurance company that certain lab tests or procedures were done.\n
                    
                    We can’t control what an insurance company reports.\n
                    
                    If you are concerned about this, please speak with your provider before tests.
                    """,
                    "Billing Questions": """
                    You may schedule an appointment to answer any billing questions. A billing question appointment is for any insurance and/or billing-related questions you might have for the billing coordinator. Please be prepared for this visit with any necessary paperwork (including billing statements, insurance information, etc.).\n
                    
                    You may schedule a billing question appointment via the Portal by logging in, selecting ‘Appointments’ and clicking the ‘Billing Questions’ option or by calling 314-935-6666.
                    """
                ]
            )
        ]
    )

    var infoMap:[String:Info] = [:]
    
    
    @IBOutlet weak var infoTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        infoMap["Mental Health Services"] = mentalHealthInfo
        infoMap["Medical and Health Care Services"] = MedicalAndHealthCareServices
//        infoMap["Medical and Health Care Services"] = medicalAndHealthCareServicesInfo
//        infoMap["Medical Promotion Services"] = healthPromotionServicesInfo
    }

    func setupTableView() {
        infoTable.dataSource = self
        infoTable.delegate = self
        infoTable.register(UITableViewCell.self, forCellReuseIdentifier: "infoCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoMap[infoSections[section]]!.services.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return infoSections[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
            header.contentView.backgroundColor = UIColor.gray
            header.textLabel?.textColor = UIColor.white
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->  UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "infoCell")
        cell.textLabel!.text = infoMap[infoSections[indexPath.section]]!.services[indexPath.row]
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return infoSections.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowText = infoMap[infoSections[indexPath.section]]!.services[indexPath.row]
        performSegue(withIdentifier: "showDetailedInfoView", sender: infoMap[infoSections[indexPath.section]]!.serviceMap[rowText])
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier! == "showDetailedInfoView" {
            let info = sender as! InfoDetail
            let detailedVC = segue.destination as! SubDetailedInfoViewController
            detailedVC.infoDetail = info
            detailedVC.header = info.headline
        }
    }
}
