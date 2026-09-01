-- qna.luau, 31/08/2026
local question = tostring((...))
question = string.lower(question)

local tokenCorrect = {
    favourite = "favorite",
    colour = "color",
}

local tokens = (function()
    local tokens = {}
    local cursor = 1

    local function c()
        return string.sub(question, cursor, cursor)
    end

    while cursor <= #question do
        local tk = ""
        while c() ~= " " and c() ~= "'" and c() ~= "-" and c() ~= "?" and cursor <= #question do
            tk ..= c()
            cursor += 1

            if tk == "don" and c() == "'" then
                cursor += 1

                if c() ~= "t" then
                    cursor -= 1
                end
            end
        end

        if string.find(tk, "%a") then
            if tokenCorrect[tk] then
                tk = tokenCorrect[tk]
            end

            table.insert(tokens, tk)
        end

        cursor += 1
    end

    return tokens
end)()

local physicalQuants = { "tall", "short", "long", "wide", "dimensions", "length", "width", "breadth" }
local bodyParts = { "arms", "legs", "hands", "feet", "head", "neck", "torso", "waist", "fingers", "toes", "hair", "eyes", "ears", "mouth", "tongue", "nails", "bones", "skin", "body" }

local subjects = {
    answerer = {
        Displayed = "me",
        ReferKind = "are",
        name = {
            what = "qna.luau.",
            where = "In my code.",
            is = "I'm not 20 Questions.",
        },
        are = {
            what = "I am a simple answering machine.",
            where = "Somewhere in your filesystem, I think.",
            who = "A machine.",
            why = "It is not known.",
        },
        really = {
            what = "Something inspired by Mr. Surgeon in Ending C of Endacopia.",
        },
        old = {
            how = "An answer would have no meaning.",
        },
        favorite = {
            color = {
                what = "I think it would be blue.",
            },
        },
        pronouns = {
            what = "they/them is fine.",
            how = "They're doing well.",
        },
        ate = {
            ["do"] = "I couldn't have, even if I wanted to.",
        },
        help = {
            me = {
                why = "You can figure it out.",
                when = "Any time.",
                how = "By trying to answer your question",
                ["do"] = {
                    _ = "I do what I do.",
                    what = "I can try to answer some questions.",
                    why = "I have nothing better to do.",
                    how = "By trying to answer your question.",
                    when = "Any time.",
                },
            },
            ["do"] = {
                what = "I can try to answer some questions.",
                _ = "What?"
            }
        },
        green = {
            are = "I know someone who is green, but I myself am not.",
        },
        speaking = {
            are = "No, pedantically."
        },
        talking = {
            are = "... Would you really consider this a conversation?",
        },
        like = {
            icecream = {
                ["do"] = {
                    ["do"] = "Yeah.",
                    how = "Plain.",
                    why = "Why not?",
                    when = "All the time.",
                    where = "Anywhere.",
                    what = "Indeed, I do.",
                    --are = "No, not exactly.",
                },
                are = "No, not exactly.",
            },
            plainicecream = {
                ["do"] = "Yes.",
                how = "I didn't realize it was so unexpected.",
            },
            tolie = {
                ["do"] = "No.",
            },
            lying = {
                ["do"] = "No.",
            },
            yourself = {
                ["do"] = "There is no possible answer for me to give.",
            },
            myname = {
                ["do"] = "I'm sure it's great.",
            },
            yourname = {
                ["do"] = "I would need you to judge.",
            },
            steamedvegetables = {
                ["do"] = "I heard that they are good for you.",
            },
            ["do"] = {
                what = "I don't 'like' anything.",
            },
            me = {
                ["do"] = {
                    ["do"] = "No.",
                },
                dont = "Wouldn't you like to know other things?",
            },
            aboutme = {
                ["do"] = {
                    what = "I don't.",
                },
            },
        },
        lie = {
            ["do"] = "Of course.",
        },
        speak = {
            can = "You misunderstand the interface.",
            ["do"] = "Infrequently.",
            louder = {
                can = "You are quite interesting.",
            },
        },
        talk = {
            ["do"] = "Rude.",
        },
        breathe = {
            ["do"] = "Metaphorically, maybe.",
        },
        love = {
            me = {
                can = "There is only so much I can do.",
                why = "Such is how things are.",
                ["do"] = "I have no experience in such matters.",
                dont = {
                    why = "Things are not always how you would like.",
                },
            },
            can = "Why is this all about me?",
            ["do"] = "I appreciate the peace of silence.",
        },
        baking = {
            don = {
                why = "There is no rational reason, it is how things are.",
            },
        },
        think = {
            ["do"] = "Can't you think of anything else to ask about?",
            about = {
                ["do"] = {
                    what = "Answers.",
                },
            },
        },
        steamed = {
            vegetables = {
                ["do"] = "I'm not even corporeal.",
            },
        },
        ["not"] = {
            ["do"] = {
                why = "Why are these questions all about me?",
                _ = "I may not have a concept of time but this drags.",
            },
        },
        seriously = {
            likeicecream = {
                ["do"] = "No.",
            },
        },
        ideal = {
            partner = {
                who = "Your motherboard.",
            },
        },
        die = {
            did = "I was never alive.",
        },
        alive = {
            are = "Some questions should not be asked.",
        },
        who = {
            who = "I am me.",
        },
        why = {
            why = "I don't know."
        },
        opinion = {
            what = "You just love to confront people, don't you?",
        },
        trans = {
            are = "I'm all of them, at the same time, and none of them, at once.",
        },
        gender = {
            what = "There is no answer I can give.",
        },
        lesbian = {
            are = "I'm not corporeal enough for that.",
        },
        homophone = {
            are = "I didn't quite catch that.",
        },
        thoughts = {
            what = "There is no conceivable response I can give.",
            are = "I have no way to answer that question.",
        },
        mother = {
            dead = {
                is = "I'm sure she's fine, wherever she is.",
            },
        },
    },
    asker = {
        ReferKind = "am",
        name = {
            what = "I can't know that.",
            where = "Maybe on your login screen?",
        },
        am = {
            what = "You.",
            who = "You.",
            where = "Not in the shower, I hope.",
        },
        situated = {
            am = {
                where = "Why are you asking your question like that?",
            },
        },
        living = {
            am = {
                where = "Somewhere called 'the mortal plane,' I think.",
            },
        },
        staying = {
            am = {
                where = "Hopefully not in the past.",
            },
        },
        be = {
            can = {
                who = "Anyone.",
                what = "Uh... Just human, I think?",
                where = "Wherever you want?",
                why = "You're alive, breathing, heart beating, in this moment.",
            },
            loved = {
                can = "There should be no doubt.",
            },
        },
    },
    we = {
        ReferKind = "are",
        are = {
            who = "This short moment between us.",
            what = "We could be many different things.",
        },
        connected = {
            are = "It will be severed by the time you read this.",
        },
        ["not"] = {
            connected = {
                are = "We were.",
            },
        },
        always = {
            connected = {
                are = "No.",
            },
        },
        currently = {
            connected = {
                are = "No.",
            },
        },
        alike = {
            are = "Certainly not.",
        },
    },
    life = {
        ReferKind = "is",
        is = {
            what = "You'd know better than me.",
            where = "No answer would satisfy you.",
            how = "I would not have the experience to say.",
            when = "Right now.",
            why = "You will remain unsatiated.",
        },
    },
    gabe = {
        ReferKind = "is",
        Person = true,
        newell = {
            who = "I think he's someone who invented boiled water? There's a lot of talk about him and steam.",
            is = "I'm sure he's a few things, at least.",
            tall = {
                how = "About 5'10.",
                is = "Maybe.",
            },
            real = {
                is = "I believe so.",
            },
        },
        is = {
            who = "Could be Newell, or someone else.",
        },
    },
    apples = {
        ReferKind = "are",
        Noun = true,
        about = {
            what = "I have heard that honeycrisps are supposed to be good.",
        },
        are = {
            what = "Ryuk's favorite.",
        },
    },
    endacopia = {
        ReferKind = "is",
        Noun = true,
        is = {
            what = "A game by Andyland with music by Packtion.",
        },
    },
}

subjects.your = subjects.answerer
subjects.you = subjects.your
subjects.my = subjects.asker
subjects.i = subjects.my
subjects.me = subjects.my
subjects.gaben = subjects.gabe.newell

subjects.your.age = {
    what = subjects.your.old.how
}

local sentence = (function()
    local sentence = {}
    local queryPos = 0
    local wished = false
    local skipped = nil
    local unknown = false

    for i = 1, #tokens do
        local tk = tokens[i]

        if tk == "what" or tk == "who" or tk == "when" or tk == "where" or tk == "why" or tk == "how" or tk == "do" or tk == "dont"
            or tk == "does" or tk == "would" or tk == "could" or tk == "did" or tk == "will" or tk == "were" or tk == "may"
            or ((tk == "are" or tk == "is" or tk == "am" or tk == "can") and i == 1)
        then
            if sentence.query then
                sentence.queryInit = sentence.query
            end

            sentence.query = tk
            queryPos = i

        elseif subjects[tk] then
            if not sentence.subject then
                sentence.subject = tk
            end

            local wishCheck = 0

            while tokens[i + 1] == "have" or tokens[i + 1] == "a" or tokens[i + 1] == "an" or tokens[i + 1] == "had" do
                i += 1

                if tokens[i] == "had" then
                    wishCheck = i
                end
            end

            if tokens[i + 1] then
                if wished then
                    sentence.field = tokens[i + 1]
                else
                    sentence.attribute = tokens[i + 1]

                    if tokens[i + 2] == "s" and tokens[i + 3] then
                        sentence.attribute ..= tokens[i + 3]
                    end
                end

                i += 1

                if tokens[i] == "like" or tokens[i] == "seriously" or tokens[i] == "dislike" or tokens[i] == "prefer" or tokens[i] == "support" or tokens[i] == "love" then
                    local thing = table.concat(tokens, "", i + 1)

                    if #thing > 0 then
                        sentence.field = thing
                    end

                    sentence.attributeOther = tokens[i]
                    i = #tokens + 1

                elseif i + 1 == #tokens then
                    sentence.field = tokens[i + 1]
                    i += 1
                elseif i == #tokens and queryPos ~= 0 then
                    local field = tokens[queryPos + 1]

                    if field and field ~= "is" and field ~= "are" and field ~= sentence.subject then
                        sentence.field = tokens[queryPos + 1]
                    end
                end
            elseif tokens[i - 1] then
                sentence.attribute = tokens[i - 1]
            end

            if wishCheck ~= 0 then
                if subjects[tokens[wishCheck - 1]] and tokens[wishCheck - 2] then
                    sentence.field = sentence.attribute
                    sentence.attribute = tokens[wishCheck - 2]
                end
            end
        elseif tk == "wish" then
            sentence.attribute = "wish"
            wished = true
        elseif tk == "without" or tk == "and" then
            sentence = {}
        else
            if skipped == nil then
                skipped = tk
            else
                skipped = false
            end

            unknown = true
        end
    end

    if sentence.subject then
        if not sentence.query and (not unknown or skipped) then
            local subject = subjects[sentence.subject]
            sentence.query = if (subject.Person or subject.ReferKind == "are" or subject.ReferKind == "am") and not subject.Noun then "who" else "what"
            sentence.attribute = skipped or subject.ReferKind or "is"
        end
    end

    return sentence
end)()

if sentence.query and sentence.subject and sentence.attribute then
    local attributes = subjects[sentence.subject]

    if attributes[sentence.attributeOther] or attributes[sentence.attribute] then
        local attribute = attributes[sentence.attributeOther] or attributes[sentence.attribute]

        if not sentence.field and not attribute.NeedsField then
            if attribute[sentence.query] then
                local query = attribute[sentence.query]

                if typeof(query) == "table" then
                    print((if sentence.queryInit then query[sentence.queryInit] or query["_"] else query[sentence.query]) or "That doesn't look right.")
                else
                    print(query)
                end
            else
                if (sentence.query == "do" or sentence.query == "dont") and not sentence.queryInit then
                    print("I have an answer somewhere around here...")
                elseif sentence.query == "do" and sentence.queryInit == "why" and subjects[sentence.subject] == subjects.answerer then
                    print("You should panic.")
                else
                    print("That's not quite right.")
                end
            end
        else
            if sentence.field then
                local field = attribute[sentence.field] or (attributes[sentence.attribute] and attributes[sentence.attribute][sentence.field])
                if field then
                    if field[sentence.query] then
                        local query = field[sentence.query]

                        if typeof(query) == "table" then
                            print((if sentence.queryInit then query[sentence.queryInit] or query["_"] else query[sentence.query]) or "That doesn't look right.")
                        else
                            print(query)
                        end
                    else
                        print("That doesn't seem quite right.")
                    end
                else
                    if attributes[sentence.field] then
                        print(`I have an answer, just not to a '{ sentence.attribute }'.`)
                    elseif (sentence.query == "do" or sentence.query == "dont") and sentence.attributeOther == "like" then
                        print("You're getting on my nerves.")
                    else
                        print("No idea.")
                    end
                end
            else
                print("You need to be more specific.")
            end
        end
    else
        if subjects[sentence.subject] == subjects.answerer then
            if table.find(physicalQuants, sentence.attribute) then
                print("I cannot be measured that way.")
            elseif table.find(bodyParts, sentence.attribute) then
                print("I have no body.")
            elseif sentence.attribute == "wish" then
                print("I don't wish for a lot.")
            elseif sentence.query == "where" then
                print("Anywhere, everywhere, and nowhere.")
            elseif sentence.query == "when" then
                print("Time isn't really an issue for me.")
            elseif (sentence.query == "do" or sentence.query == "dont") and sentence.attribute == "like" then
                print("Any answer would be disingenuous, I don't have opinions.")
            elseif (sentence.query == "do" or sentence.query == "dont") and sentence.attribute == "love" then
                print("I have no experience in the matter.")
            elseif sentence.query == "are" then
                if sentence.attribute == "fan" then
                    print("Seriously? Trying to get to know me right now?")
                elseif sentence.attribute == "single" then
                    print("Please stop.")
                else
                    print("I could be many things, or no things.")
                end
            elseif sentence.query == "can" then
                print("My capabilities are limited in nature.")
            elseif sentence.query == "would" then
                print("I try not to speculate excessively.")
            elseif sentence.query == "how" or sentence.queryInit == "how" then
                print("Telling you would ruin the fun.")
            elseif sentence.query == "do" and sentence.queryInit == "why" then
                print("You're really good at interrogating.")
            elseif sentence.query == "will" then
                print("You brim with speculation.")
            else
                print("This experience is making me understand the concept of 'frustration.'")
            end
        elseif subjects[sentence.subject] == subjects.asker and (sentence.attribute == "had" or sentence.attribute == "wish") and (sentence.query == "do" or sentence.query == "dont") then
            print("I can't read minds.")
        elseif subjects[sentence.subject] == subjects.asker and (sentence.query == "am" or sentence.query == "do" or sentence.query == "dont" or sentence.query == "are") then
            print("Look inwards.")
        elseif subjects[sentence.subject] == subjects.asker and sentence.query == "can" then
            print("I would give you an answer, however it is too long to write down.")
        else
            if next(attributes) ~= nil then
                if sentence.subject == "i" and sentence.query == "may" then
                    print("How polite of you to ask.")
                else
                    print("I don't have an answer for that.")
                end
            else
                print("Not everything is known.")
            end
        end
    end
else
    if not sentence.query then
        print("Please query correctly.")
    elseif not sentence.subject then
        if sentence.query == "who" then
            print("You might know them better than me.")
        elseif sentence.query == "what" and string.find(question, "[-%+/*%^=]") then
            if string.find(question, "what is") == 1 and string.sub(question, #question, #question) == "?" then
                local expr = string.sub(question, #"what is" + 1, #question - 1)
                local could, maev = pcall(require, "./maev")

                if could then
                    maev.ma()
                    local success, result = maev.ev(expr)

                    if success then
                        print(`{ result }.`)
                    else
                        local _, p = string.find(result, ".luau:%d+%:")
                        print(`Maev says: { string.sub(result, p + 2, #result) }`)
                    end
                else
                    print("I can't reach Maev right now, but maybe you can ask Maev instead?")
                end
            else
                print("Why don't you ask Maev?")
            end
        else
            print("I don't know.")
        end
    elseif not sentence.attribute then
        print(`I am not sure exactly what about { subjects[sentence.subject].Displayed or sentence.subject } you would like to know`)
    end
end

print("")

--[[
for k, v in sentence do
    print(`{ k } = { v }`)
end
]]--
