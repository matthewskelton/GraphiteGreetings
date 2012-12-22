# XmasGraphite.rb
# ---
# Some festive cheer via the graphite gem and Graphite server
# Matthew Skelton, 2012
# http://matthewskelton.net/
# @matthewpskelton

# Graph settings:
# - Show last 30 mins
# - Line mode: Connected line
# - Line thickness: 8
# - Make the plot area taller than it is wide
# - Add the metrics in the following order for the correct colours:
#    Tinsel1 
#    Branches1  
#    Tinsel2 
#    Tinsel3 
#    Trunk
#    Star1
#    Floor
#    Ignore1
#    Tinsel4
#    Ignore2
#    Star3
#    Ignore3
#    Ignore4
#    Branches2
#    Ignore5
#    Ignore6
#    Ignore7
#    Star2

require 'Graphite'
require 'Logger'

# Change these as needed for your environment
server = "my.graphite.server.url"
log = Logger.new(STDOUT)
prefix = "Test.Me.XmasTree."

# Create the logger to send stats to Graphite with specific timings
logger = Graphite::Logger.new(server,log)

# Define the offsets
#
# Use Now as a starting point, 
# or set a specific time e.g. Time.utc(2012,12,22,19,10,30)
# We need a 20-minute window to plot 
t = Time.now
t0 = Time.at(t.to_i - (20 * 60))    # 20 mins ago
t1 = Time.at(t0.to_i + (60 * 1))    # Left base of tree
t2 = Time.at(t0.to_i + (60 * 3))    # Lower tinsel2
t3 = Time.at(t0.to_i + (60 * 6))    # Lower tinsel3
t4 = Time.at(t0.to_i + (60 * 7))    # Lower tinsel4
t5 = Time.at(t0.to_i + (60 * 8))    # Top left trunk
t6 = Time.at(t0.to_i + (60 * 9))    # Bottom left trunk
t7 = Time.at(t0.to_i + (60 * 9))    # Bottom left star
t8 = Time.at(t0.to_i + (60 * 9))    # Middle left start
t9 = Time.at(t0.to_i + (60 * 9))    # Top left star
t10 = Time.at(t0.to_i + (60 * 11))  # Top right star
t11 = Time.at(t0.to_i + (60 * 11))  # Middle right star
t12 = Time.at(t0.to_i + (60 * 11))  # Bottom right star
t13 = Time.at(t0.to_i + (60 * 11))  # Bottom right trunk
t14 = Time.at(t0.to_i + (60 * 12))  # Top right trunk
t15 = Time.at(t0.to_i + (60 * 12))  # Upper tinsel4
t16 = Time.at(t0.to_i + (60 * 13))  # Upper tinsel3 
t17 = Time.at(t0.to_i + (60 * 14))  # Upper tinsel2
t18 = Time.at(t0.to_i + (60 * 16))  # Upper tinsel1
t19 = Time.at(t0.to_i + (60 * 18))  # Right base of tree
t20 = Time.at(t0.to_i + (60 * 10))  # Top of tree
t21 = Time.at(t0.to_i + (60 * 5))   # Lower tinsel1


# Inject the stats - the order is determined by the default Graphite colours 
logger.log(t21,{prefix + "Tinsel1" => 3})
logger.log(t18,{prefix + "Tinsel1" => 6})
logger.log(t1,{prefix + "Branches1" => 3})
logger.log(t20,{prefix + "Branches1" => 18})
logger.log(t19,{prefix + "Branches1" => 3})
logger.log(t2,{prefix + "Tinsel2" => 6})
logger.log(t17,{prefix + "Tinsel2" => 9})
logger.log(t3,{prefix + "Tinsel3" => 10})
logger.log(t16,{prefix + "Tinsel3" => 12})
logger.log(t5,{prefix + "Trunk" => 3})
logger.log(t6,{prefix + "Trunk" => 0})
logger.log(t13,{prefix + "Trunk" => 0})
logger.log(t14,{prefix + "Trunk" => 3})
logger.log(t7,{prefix + "Star1" => 17})
logger.log(t10,{prefix + "Star1" => 19})
logger.log(t0,{prefix + "Floor" => 0})
logger.log(t0,{prefix + "Ignore1" => 0})
logger.log(t4,{prefix + "Tinsel4" => 13})
logger.log(t15,{prefix + "Tinsel4" => 14})
logger.log(t0,{prefix + "Ignore2" => 0})
logger.log(t8,{prefix + "Star3" => 18})
logger.log(t11,{prefix + "Star3" => 18})
logger.log(t0,{prefix + "Ignore3" => 0})
logger.log(t0,{prefix + "Ignore4" => 0})
logger.log(t1,{prefix + "Branches2" => 3})
logger.log(t19,{prefix + "Branches2" => 3})
logger.log(t0,{prefix + "Ignore5" => 0})
logger.log(t0,{prefix + "Ignore6" => 0})
logger.log(t0,{prefix + "Ignore7" => 0})
logger.log(t9,{prefix + "Star2" => 19})
logger.log(t12,{prefix + "Star2" => 17})

# Enjoy!
