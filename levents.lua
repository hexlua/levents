-- creates a new event emitter
local function new()
    local e = {}
    e.data = {} -- other properties of `e` are reserved for future use

    -- internal function to create an empty event if it doesn't exist
    function initevent(self, name)
        if self.data[name] == nil then
            self.data[name] = {
                on = {},
                once = {},
                active = true,
            }
        end
    end

    -- add a listener
    function e:on(name, listener)
        initevent(self, name)
        table.insert(self.data[name].on, listener)
        return listener
    end

    -- add a listener that is only executed once
    function e:once(name, listener)
        initevent(self, name)
        table.insert(self.data[name].once, listener)
        return listener
    end

    -- remove a listener
    function e:off(name, listener)
        initevent(self, name)
        local i = #self.data[name].on
        while i > 0 do
            if self.data[name].on[i] == listener then
                table.remove(self.data[name].on, i)
                return true
            end
            i = i - 1
        end
        i = #self.data[name].once
        while i > 0 do
            if self.data[name].once[i] == listener then
                table.remove(self.data[name].once, i)
                return true
            end
            i = i - 1
        end
        return false
    end

    -- whether the event is active
    function e:isactive(name)
        initevent(self, name)
        return self.data[name].active
    end

    -- deactivates the event
    function e:deactivate(name)
        initevent(self, name)
        self.data[name].active = false
    end

    -- activates the event
    function e:activate(name)
        initevent(self, name)
        self.data[name].active = true
    end

    -- removes an event
    function e:clear(name)
        self.data[name] = nil
    end

    -- emits an event
    function e:emit(name, ...)
        initevent(self, name)
        local i = #self.data[name].on
        while i > 0 do
            self.data[name].on[i](...)
        end
        i = #self.data[name].once
        while i > 0 do
            self.data[name].once[i](...)
        end
        self.data[name].once = {}
    end

    -- return the event emitter
    return e
end

return new