Quest={}
Quest.quest_active={}
Quest.finished_Quest={}

function Quest.new(id) 
    local temp={id=id,
                name="",
                desc="", 
                reqA={},
                reqB={}}
    Quest.quest_active[id]=temp
end

function Quest.finished(id)
    local temp = Quest.quest_active[id]
    Quest.finished_Quest[id] = temp
    Quest.quest_active[id] = nil
end

function Quest.exist(id) 
    if Quest.quest_active[id]~=nil then
        return true
    end
    return false
end