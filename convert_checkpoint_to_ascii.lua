--[[
A quick script for converting checkpoints to ASCII checkpoints.
Ascii checkpoints are useful to run on ARM 32b systems such as
Raspberry Pi 2 (ARMv7)
]]--

require 'torch'
-- local imports
require 'misc.LanguageModel'

cmd = torch.CmdLine()
cmd:text()
cmd:text('Convert a checkpoint to an ASCII checkpoint.')
cmd:text()
cmd:text('Options')
cmd:argument('-model','Model checkpoint to convert')
cmd:text()

-- parse input params
local opt = cmd:parse(arg)

local checkpoint = torch.load(opt.model)

-------------------------------------------------------------------------------

local savefile = opt.model .. '_ascii.t7' -- append "ascii.t7" to filename
torch.save(savefile, checkpoint, 'ascii')
print('saved ' .. savefile)

