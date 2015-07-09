module Constantinople

  # Global variables for battle engines
  # The battle engine methods had to be nested in their respective sections so
  # the randomizer will throw up a different number each time
  $luck_factor = 0.20
  $theodosian_walls = 15_000
  $ottoman_army = 200_000
  $eastern_roman_army = 15_000
  $city_pop = 50_000
  $western_reinforcements
  $wall_damage


  def game_intro # Introduces the game background
    puts <<-END

    Welcome to ROMA ETERNA!

    Will you see Nova Roma remain in Christian hands up to present or allow
    history to take its course and it becomes today's Istanbul?

    The year is 1453, and centuries-old Constantinople, capital of the
    Eastern Roman Empire, grandest of all cities, Mistress of the East,
    and guardian of Europe and Christendom for a thousand years, is but a shadow
    of its former glory, and is being besieged by a powerful Turkish army,
    hundreds-of-thousands strong.

    By this time, what remains of the realm that once ruled most of the known
    world has been reduced to a small sliver of land surrounding the immediate
    environs of the city.

    There are no more Roman legions - those armies that conquered powerful
    empires and defended vast borders that kept the empire and its citizens
    prosperous and secure.

    They exist only in lore and legend.

    Your objective, as either Roman Emperor Constantine XI or
    Ottoman Sultan Memet II, is to ensure its survival or absolute conquest.

    Your orders will be carried out by your most trusted advisors:

    Strategoi Solomon of Delos and Agha Izmir of Aleppo, respectively.

    HOW TO PLAY: Just enter letter in parentheses of your choice! GOOD LUCK!

    Begin!

    Choose side: play as (R)oman or (O)ttoman?

    END
  end
  def game_play # Game proper
    case gets.chomp.downcase
    when 'r' # Player has chosen to be Roman
      sleep(3)
      puts <<-END

    Strategoi Solomon: My lord Constantine, the Turks are upon us,
    and on you lies the destiny of our proud Roman race!

    What is your command?

    (N)egotiate, (f)ight, or (s)urrender the city?

      END
      case gets.chomp.downcase
      when 'n' # Roman decides to negotiate
        sleep(3)
        puts <<-END

    Sending ambassador Nicopherus to the enemy camp. We should hear from
    him shortly, that is, if he isn't beheaded sooner.

    My lord, reports say Turkish demands are in. I am sending for their
    representatives, and here they are!

    (P)ay a large tribute in gold, submit as a (v)assal to Memet II, or
    (c)onclude a treaty of friendship with him and give the hand of your
    eldest daughter, the Princess Theodora Porphyrogenita, in marriage
    to the Sultan's son and heir.

        END
          case gets.chomp.downcase
          when 'p' # Roman will pay tribute
            sleep(3)
            puts <<-END

    How much of the treasury do we give? Enter a number:
    (do not underestimate what gold will do to change people's minds).

            END
            gold_amount = gets.to_i # Sets condition based on input from player
              if gold_amount < 1_000_000
                sleep(3)
                puts <<-END

    You see?! I told you so - the Sultan deemed your offer an insult
    and has ordered his army to begin its assault! Your short-sightedness
    has brought closer our doom!

    You are a disgrace! I myself will go out to lead the defense,
    and if through a miracle, we manage to win, I hope your
    Imperial Bodyguards have had the sense to evacuate
    you and your family from this place!

                END
                def constantinople_attack # Battle engine
                  $western_reinforcements = rand(50_000..75_000)
                  if $western_reinforcements > 60_000
                    sleep(3)
                    puts <<-END

    It is a good thing that reinforcements from the West are here! They are
    forming up to join our attack!
                    END
                  else
                    sleep(3)
                    puts <<-END

    The West did send reinforcements. Let us hope they
    will be enough. We need all the help we can get.
                    END
                  end
                    roman_attack = rand((150_000)..($ottoman_army)) - ($eastern_roman_army + $western_reinforcements)
                    # Calculates battle results with randomizer for strengths of opposing armies due to
                    #reinforcements and casualties, etc., and based on theory of 3 attackers vs. 1 defender
                    sleep(5)
                    msg = 'BATTLE IN PROGRESS! BATTLE IN PROGRESS!'

                    15.times do
                      print "\r#{ msg }"
                      sleep 0.5
                      print "\r#{ ' ' * msg.size }" # Flashes what is taking place.
                      sleep 0.5
                    end

                  if roman_attack > rand(90_000..110_000)
                    sleep(3)
                    puts <<-END

    Praise God for this miracle! We have defeated the Turks!
    They were broken on our walls and are fleeing in disarray!

    The gates have opened and our cavalry are in pursuit of
    survivors, and a detachment is right now searching for
    the Sultan and members of his court.

    The city is delivered from conquest!

    GAME OVER. ROMA ETERNA!

    END
                  else
                    sleep(3)
                    puts <<-END

    DISASTER! Our army has been defeated! The Turks will surely
    breach our walls now and we have no more defenders left to man them!

    Make ready to flee, my lord! There is a ship currently at harbor that is
    waiting to take you to Italy!

    From there, you may seek help from The Pope in Rome to call for a
    crusade to retake our city!

    Go now, for there is no time left!

    GAME OVER. YOU LOSE!

                    END
                  end
                end
                sleep(5)
                constantinople_attack() # Calls on battle engine to decide outcome
              else
                sleep(3)
                puts <<-END

    Wise choice, Basileus.  Because of your foresight, the Asiatic hordes
    have lifted the siege and are now breaking camp.

    History will show that you will use this time wisely to
    rebuild Constantinople's empire, army and morale!

    Praise God that no more need die today.

    Congratulations!

    GAME OVER. YOU WIN! ROMA ETERNA!

                END
              end
          when 'v' # Roman will submit as a vassal
            sleep(3)
            puts <<-END

    God help us! Constantinople never before has submitted to a
    foreign ruler! The Sultan expects you to send your army to
    fight for him whenever he calls. I am ashamed to call you Emperor!

    There is a large body of men approaching the palace.

    Guards! Secure this place.

            END
            def coup_d_etat # Calculates chances of being deposed by unhappy Romans due to cowardice
              rand((0.1)..(0.25))
            end
            overthrow = coup_d_etat # What happens to you next
            to_percent = overthrow * 100
            sleep(5)

    puts "The chance of a palace coup is: #{to_percent.floor}%!"
              if overthrow > 0.2
                sleep(3)
                puts <<-END

    You have been deposed by your Imperial bodyguards, The Varangians!
    They will never bow to a foreign despot! You are about to be
    blinded and stripped of the Imperial regalia.

    GAME OVER. YOU LOSE!

                END
              else
                sleep(3)
                puts <<-END

    That mob is your people wanting refuge within the safest
    place in the city when the Turks enter! Do you want to open
    the armories for a last-ditch defense, (y) or (n)?
                END
                  final_defense = gets.chomp.downcase
                    if final_defense === "y"
                      citizen_army = ($city_pop * rand(0.0..0.25)) + $eastern_roman_army
                      # Checks to see if can recruit from city_pop to add to eastern_roman_army and bolster city defense
                        if citizen_army > $ottoman_army / rand(6..12)
                          # Checks to see if enough troops have been raised to stand a chance at
                          # successfully repelling invading ottoman_army
                          sleep(3)
                          puts <<-END

    A new levy has been successfully raised and it is assembling
    in the main square, my lord Constantine. It numbers in the thousands!

    The city may yet have hope!

    Go out and lead them to victory!

                          END
                          def constantinople_attack # Battle engine
                            $western_reinforcements = rand(50_000..75_000)
                            if $western_reinforcements > 60_000
                              sleep(3)
                              puts <<-END

    Reinforcements from the West are here! They are forming up to join
    our attack!"
                              END
                            else
                              sleep(3)
                              puts <<-END

    The West did send reinforcements. Let us hope they will be enough.
                              END
                            end
                              roman_attack = rand((150_000)..($ottoman_army)) - ($eastern_roman_army +  $western_reinforcements)
                              # Calculates battle results with randomizer for strengths of opposing armies due to reinforcements
                              # and casualties, etc., and based on theory of 3 attackers vs. 1 defender
                              sleep(5)
                              msg = 'BATTLE IN PROGRESS! BATTLE IN PROGRESS!'

                              15.times do
                                print "\r#{ msg }"
                                sleep 0.5
                                print "\r#{ ' ' * msg.size }" # Flashes what is taking place.
                                sleep 0.5
                              end
                            if roman_attack > rand(90_000..110_000)
                              sleep(3)
                              puts <<-END

    Praise God, my lord Constantine! We have defeated the Turks! They were
    broken on the field and are fleeing in disarray!

    Our cavalry are in pursuit and a detachment is right now searching for
    the Sultan and members of his court.

    You have delivered our city from conquest! You will be known to
    history forever!

    GAME OVER. YOU WIN! ROMA ETERNA!

                              END
                            else
                              sleep(3)
                              puts <<-END

    DISASTER! Our army has been defeated! The Turks will surely breach our walls
    now and we have no more defenders left to man them!

    Make haste to the harbor where a ship is waiting to take you to Italy,
    there to ask The Pope for help in launcing a crusade!

    Go now and with God!

    GAME OVER. YOU LOSE!

                              END
                            end
                          end
                          sleep(5)
                          constantinople_attack() # Calls on battle engine to decide outcome
                        else
                          sleep(3)
                          puts <<-END

    Alas! All is lost. Our citizens do not even care to fight for their city
    anymore! The recruitment effort has barely enrolled a thousand souls! That
    is not enough to hold the main square!

    Cowards, all of them! What are their lives worth if instead of enlisting
    to defend their homes, they just wait for the Turks to come and kill
    them and take all they ever had?!

    There is no more hope!

    You, my lord, need to hurry to the harbor. There lay in anchor is a ship
    waiting to take you to Italy to plead for help from The Pope, that he
    may launch a crusade!

    Go now!

    GAME OVER. YOU LOSE!

                          END
                        end
                    elsif final_defense === "n"
                      sleep(3)
                      puts <<-END

    DISASTER!!

    You do not have the will to fight??

    You do not deserve to wear the purple of Rome and are a disgrace
    to your namesake!

    Reports are in that general Belisarius is sailing from Trebizond
    with relief and is intent on deposing you!

    I would not want to be you for all the gold in the world nor
    here when the general arrives and annihilates the armies of Memet!

    Stand aside, my lord, and I will lead our defense while we
    wait for relief!

    Guards!

    Take the Emperor to his quarters and see to it that
    he is not to be disturbed. Admit no one, and I mean nobody
    is allowed to see him - not even the Empress herself!

    Go!

    GAME OVER. YOU LOSE!

                      END
                    end
              end
          when 'c' # Roman will conclude a treaty of friendship <-- least risky course
            # of action and solves the "Byzantine General's Problem"
            sleep(3)
            puts <<-END

    I think for now that is the wisest course of action. For more than
    fifteen centuries, we Romans have been masters of our destiny.
    We can bear this state of affairs for now.

    The Sultan is most pleased by your decision and awaits the
    Princess Theodora Porphyrogenita in his camp and is proud to
    call you brother! Let our two realms coexist peacefully
    side-by side for all time!

    My lord, The Turks are pulling down their siege towers and
    are breaking camp. Well done!

    History will show that you will use this time wisely to rebuild
    Constantinople's empire, army and morale!

    GAME OVER. YOU WIN! ROMA ETERNA!

            END
          else # Roman default
            sleep(3)
            puts <<-END

    What kind of choice is that? These are desperate times, my lord.

    The fate of the city rests on your decision!

    It cannot survive on indecision or incompetence.

    GAME OVER. YOU LOSE!

            END
          end
      when 'f' # Roman has decided to fight
        sleep(3)
        puts <<-END

    Very good, my lord, and we give battle at once! Sound the trumpets!
    We may no longer have the troops to sally forth to meet and overwhelm
    the enemy on the field, but we will make sure they never breach our walls!

    I will see that all gates are barred shut and all towers and
    ramparts are manned.

    We have more than enough provisions to last us years, and the
    West will surely send help!

    They cannot afford not to! If Constantinople falls, Europe will fall!

        END
        def constantinople_attack # Battle engine
          $western_reinforcements = rand(50_000..75_000)
          if $western_reinforcements > 60_000
            sleep(3)
            puts <<-END
    Large reinforcements from the West are here! They are
    forming up to join the attack!
            END
          else
            sleep(3)
            puts <<-END

    The West did send some reinforcements. Let us hope they
    are enough.
            END
          end
            roman_attack = rand((150_000)..($ottoman_army)) - ($eastern_roman_army + $western_reinforcements)
            # Calculates battle results with randomizer for strengths of opposing armies due
            # to reinforcements and casualties, etc., and based on theory of 3 attackers vs. 1 defender
            sleep(5)
            msg = 'BATTLE IN PROGRESS! BATTLE IN PROGRESS!'

            15.times do
              print "\r#{ msg }"
              sleep 0.5
              print "\r#{ ' ' * msg.size }" # Flashes what is taking place.
              sleep 0.5
            end
          if roman_attack > rand(90_000..110_000)
            sleep(3)
            puts <<-END

    Praise God, my lord Constantine! We have defeated the Turks!
    They were broken on the field and are fleeing in disarray!

    Our cavalry are in pursuit and a squadron is right now searching
    for the Sultan and members of his court.

    You have delivered our city from conquest! You will be be known
    to history forever!

    GAME OVER. YOU WIN! ROMA ETERNA!

            END
          else
            sleep(3)
            puts <<-END

    DISASTER!

    Our army has been defeated! The Turks will surely breach
    our walls now and we have no more defenders left to man them!

    I pray the invaders to be merciful, though I doubt it.

    Make ready to flee through the catacombs!

    Go! Quickly! There is a ship by the harbor waiting to take you to Italy!

    Farewell, my Emperor!

    GAME OVER. YOU LOSE!

            END
          end
        end
        sleep(5)
        constantinople_attack() # Calls on the attack
      when 's' # Roman will surrender the city
        sleep(3)
        puts <<-END

    DISASTER!!

    You do not have the will to fight?? You do not deserve to wear the
    purple of Rome and are a disgrace to your namesake!

    Reports are in that general Belisarius is sailing from Trebizond
    with relief and is intent on deposing you!

    I would not want to be you for all the gold in the world nor here
    when the general arrives and annihilates the armies of Memet!

    Stand aside, my lord, and I will lead our defense while we wait for relief!

    Guards, take the Emperor to his quarters and see to it that he is not
    to be disturbed. Admit no one, and I mean nobody is allowed to see him
    - not even the Empress herself!

    Go!

    GAME OVER. YOU LOSE!

        END
      else # Roman default
        sleep(3)
        puts <<-END

    What kind of choice is that? These are desperate times, my lord.

    The fate of the city rests on your decision!

    It cannot survive on indecision or incompetence.

    GAME OVER. YOU LOSE!

        END
      end
    when 'o' # Player has chosen to be Ottoman
      sleep(3)
      puts <<-END

    Agha Izmir: My Sultan Memet, Sire! We are finally besieging the
    greatest city in the world, and God-willing, it will soon belong to you!

    What would you have us do?

    (E)ntreat with the Emperor Constantine and have him submit to your
    authority, (d)emand ranson, (a)ssault the Theodosian Walls?

      END
      case gets.chomp.downcase
      when 'e' # Ottoman will entreat with Roman
        sleep(3)
        puts <<-END

    Very well. Their representative, Count Nicopherus and his retinue are
    just outside the camp. I will tell the guards to admit them.

    The Roman ambassador is here, Sire. While I do not necessarily agree
    with it, diplomacy seems to be the order of the day.

    I know Nicopherus quite well. He and I grew up together in his father's
    estate near Adrianople when I was a hostage for my own father's
    good behavior. I was well-treated and released after academy training
    years later.

    One can say I learned statecraft at his father's knee.

    It is quite ironic to meet him again after all this time in vastly
    different circumstances.

    While crafty and shrewd, he is also very honorable.

    I just pray the Romans have the good sense to accept our offer
    - that we will withdraw from their former European territories if
    they promise to abandon Asia Minor and Africa province.

    Do we begin? (Y)es or (n)o?

        END
        case gets.chomp.downcase
        when 'y'
        never_on_tuesday = Time.now.strftime("%A") # Constantinople was conquered
        # on a Tuesday and is the unluckiest day of the week in that part of the world
          if never_on_tuesday === "Tuesday"
            charm = 0
          else charm = rand(0..50)
          end
          roman_pride = rand(0..51) # When charm is 0, it becomes necessary to give Rome, i.e.
          # if you play this game on a Tuesday, the engine gives an already disadvantaged
          # side a one percent delta to effect a win
          sleep(5)
          msg = 'NEGOTIATIONS IN PROGRESS! NEGOTIATIONS IN PROGRESS!'

          15.times do
            print "\r#{ msg }"
            sleep 0.5
            print "\r#{ ' ' * msg.size }" # Flashes what is taking place.
            sleep 0.5
          end
            negotiation_proper = charm + roman_pride
            if negotiation_proper > rand(45..55)
              sleep(3)
              puts <<-END

    Sultan!

    They have agreed to everything we proposed!

    We will hand over territory up to the Danube in the north, where the Bulgars
    are, and near the Italian border to the west, and then the Euxine Sea
    in the east.

    We will also guarantee their sovereignty over the Hellespont
    and the Bosporus. Leave it in their hands to deny them to Western armies
    on their way east!

    In return, they on the other hand relinquish claim and
    control over Anatolia, Palestina, Aegyptus, and Africa.

    Congratulations!

    GAME OVER. YOU WIN!

              END
            else
              sleep(3)
              puts <<-END

    They said "NO" to everything! It beggars belief!

    That is not my friend, Nicopherus' logic. It must be Constantine's!

    Why in God's name refuse such a generous offer?

    Constantinople is not what it once was! There are no more Augustii
    on the throne!

    The last of the true Romans died with Justinian nearly a thousand years ago!

    I should have guessed this was a waste of time!

    It is a pity Nicopherus allowed himself to be used by Constantine this way.
    I knew this was nothing but a delaying tactic on their part.

    Guards!

    Escort my dear friend the Count, but the hold members of his retinue and
    behead them. That will teach them to play games when their very
    survival is at stake!

    We must attack at once!

              END
              def ottoman_attack # Battle engine
                $western_reinforcements = rand(50_000..75_000)
                if $western_reinforcements > 60_000
                  sleep(3)
                  puts <<-END

    Sire! Scouts bring word that reinforcements from Europe have just landed.
    They are bolstering city defenses as we speak!

                  END
                else
                  sleep(3)
                  puts <<-END

    It seems as if reinforcements from the West have arrived, but reports
    indicate their numbers are not what Constantine had been promised. Ha!

                  END
                end
                  ottoman_army_attack = rand((150_000)..($ottoman_army)) - ($eastern_roman_army + $western_reinforcements)
                  # Calculates battle results with randomizer for strengths of opposing armies due to reinforcements
                  # and casualties, etc., and based on theory of 3 attackers vs. 1 defender
                  sleep(5)
                  msg = 'BATTLE IN PROGRESS! BATTLE IN PROGRESS!'

                  10.times do
                    print "\r#{ msg }"
                    sleep 0.5
                    print "\r#{ ' ' * msg.size }" # Flashes what is taking place.
                    sleep 0.5
                  end
                  if ottoman_army_attack > rand(90_000..110_000)
                    sleep(3)
                    puts <<-END

    Praise God, Sultan! We have taken the city! The remnants of
    heir army are fleeing through their tunnels.

    Janissaries are attempting to storm the Imperial Palace,
    and we should eliminate all further resistance in a day or two.

    Then, we can let the customary three-day looting begin!

    Congratulations, Memet II, Conqueror of The Roman Empire!

    GAME OVER. YOU WIN!

                    END
                  else
                    sleep(3)
                    puts <<-END

    DISASTER!

    Our assault has been has been repelled! It must surely
    be those reinforcements.

    Curse the Romans! We should order all surviving troops
    to regroup and withdraw to safety in the west. We still have sizeable
    formations encamped there to dissuade Constantine from ordering
    a counterattack!

    We will bring down this city once and for all, but perhaps now is
    not yet the time.

    GAME OVER. YOU LOSE!

                    END
                  end
              end
              sleep(5)
              ottoman_attack()
            end
        when 'n'
          sleep(3)
        puts <<-END

    Sultan, we must not resort to tricks and should show to be more honorable
    than these infidels.

    If you do not have any intentions of negotiating with their representatives,
    let us release them and begin our assault at once!

    Should we attack now? (Y)

        END
        case gets.chomp.downcase
          when 'y'
            sleep(3)
            puts <<-END

    Excellent. Count Nicopherus and his party have left and orders are
    now going out to our commanders.

    The assault should commence at any moment.

            END
            def ottoman_attack # Battle engine
              $western_reinforcements = rand(50_000..75_000)
              if $western_reinforcements > 60_000
                sleep(3)
                puts <<-END

    Sire! Scouts bring word that reinforcements from Europe have just landed.
    They are bolstering city defenses as we speak!"
                END
              else
                sleep(3)
                puts <<-END

    It seems as if reinforcements from the West have arrived, but reports
    indicate their numbers are not what Constantine had been promised. Ha!"
                END
              end
                ottoman_army_attack = rand((150_000)..($ottoman_army)) - ($eastern_roman_army + $western_reinforcements)
                # Calculates battle results with randomizer for strengths of opposing armies due to reinforcements
                # and casualties, etc., and based on theory of 3 attackers vs. 1 defender
                sleep(5)
                msg = 'BATTLE IN PROGRESS! BATTLE IN PROGRESS!'

                15.times do
                  print "\r#{ msg }"
                  sleep 0.5
                  print "\r#{ ' ' * msg.size }" # Flashes what is taking place.
                  sleep 0.5
                end
                if ottoman_army_attack > rand(90_000..110_000)
                  sleep(3)
                  puts <<-END

    Praise God, Sultan! We have taken the city! The remnants of
    their army are fleeing through their tunnels.

    Janissaries are attempting to storm the Imperial Palace,
    and we should eliminate all further resistance in a day or two.

    Then, we can let the customary three-day looting begin!

    Congratulations, Memet II, Conqueror of The Roman Empire!

    GAME OVER. YOU WIN!

                  END
                else
                  sleep(3)
                  puts <<-END

    DISASTER!

    Our assault has been has been repelled! It must surely be
    those reinforcements.

    Curse the Romans! We should order all surviving troops to regroup
    and withdraw to safety in the west. We still have sizeable formations
    there to dissuade Constantine from any notion of a counterattack.

    We will bring down this city once and for all, but perhaps
    now is not yet the time.

    GAME OVER. YOU LOSE!

                  END
                end
            end
            sleep(5)
            ottoman_attack()
          else
          end
        end
      when 'd' # Ottoman will demand ransom
        sleep(3)
        puts <<-END

    Tell his Imperial Majesty, that the price of peace is we will accept no less
    than 1,000,000 lbs. of minted bullion, and he has a fortnight to reply.

    Let us await what they say.

        END
        roman_gold = rand(500_000..1_500_000) # Generate random amount Romans
        # are willing to pay after demand is made
        sleep(5)

    puts "Sultan, the Romans have sent" + " #{roman_gold} " + "pounds."
          if roman_gold < 1_000_000
            sleep(5)
            puts <<-END

    Those misers! They insult us not with that amount but with their
    arrogance to offer it. We attack at once!

    Do we deploy artillery, Sire? (Y)es or (n)o?

            END
            deploy_cannon = gets.chomp.downcase
              if deploy_cannon === "y"
                sleep(3)
                puts <<-END

    Yes! Move the cannon into position and shoot at will!

    Let us see if that bronze is worth its weight in gold!

    We paid a small fortune for them and they had better work.

                END
                sleep(5)
                msg = 'BATTLE IN PROGRESS! BATTLE IN PROGRESS!'

                15.times do
                  print "\r#{ msg }"
                  sleep 0.5
                  print "\r#{ ' ' * msg.size }" # Flashes what is taking place.
                  sleep 0.5
                end
                cannon_shot = rand(1..10_000) # Attempts to break down walls
                $wall_damage = $theodosian_walls - cannon_shot - ($luck_factor * cannon_shot)
                  if $wall_damage > 10_000
                    sleep(3)
                    puts <<-END

    Praise God, Sultan! A huge section has collapsed and the breach
    is wide enough for hundreds of our troops to pour through
    at once!

    We have taken the city! The remnants of their army are fleeing
    through their tunnels.

    That Viennese cannon-maker has delivered. We must have him forge
    us some more.

    Janissaries are attempting to storm the Imperial Palace,
    and we should eliminate all further resistance in a day or two.

    Then, we can let the customary three-day looting begin!

    Congratulations, Memet II, Conqueror of The Roman Empire!

    GAME OVER. YOU WIN!

                    END
                  else
                    sleep(3)
                    puts <<-END

    These cannon are useless! Get the sappers!

    Yes, Sire. Tunneling has commenced! Theodosius' walls are
    not just stout, they are deep, and it will take time to burrow
    underneath them and make sure we have packed enough powder to
    bring down a section.

                    END
                    sleep(5)
                    msg = 'BATTLE IN PROGRESS! BATTLE IN PROGRESS!'

                    10.times do
                      print "\r#{ msg }"
                      sleep 0.5
                      print "\r#{ ' ' * msg.size }" # Flashes what is taking place.
                      sleep 0.5
                    end
                      sappers_progress = rand(1..6_500) # Attempts to break down walls with
                      # different chance percentage because sappers are inherently a weaker value attack than artillery
                      wall_damage_sappers = $theodosian_walls - sappers_progress - ($luck_factor * sappers_progress)
                        if wall_damage_sappers > 7_500
                          sleep(3)
                          puts <<-END

    Praise God, Sultan! The sappers have managed to
    undermine and bring down a large section of walls in
    a lightly-defended area!

    The breach is large enough that hundreds of our troops
    can pour through at once!

    We have taken the city! The remnants of their army are fleeing
    through their tunnels.

    Janissaries are attempting to storm the Imperial Palace, and
    we should eliminate all further resistance in a day or two.

    Then, we can let the customary three-day looting begin!

    Congratulations, Memet II, Conqueror of The Roman Empire!

    GAME OVER. YOU WIN!

                          END
                        else
                          sleep(3)
                          puts <<-END

    DISASTER!

    Our assault has been has been repelled! How could this be?

    Curse the Romans! We should order all surviving troops to
    regroup and withdraw to safety in the south. I have placed sizeable
    formations there to guard against any landings from Europe, and joining
    what strength we still have will dissuade Constantine from ordering
    a counterattack.

    We will bring down this city once and for all, but perhaps
    now is not yet the time.

    And behead that useless Viennese cannon-maker when you
    find him!

    GAME OVER. YOU LOSE!

                          END
                        end
                  end
              elsif deploy_cannon === "n"
                sleep(3)
                puts <<-END

    Very well. Siege towers are on their way! We have more than two score
    and the Romans simply don't have enough men to bring them all down!

    Come to the pavillion and let us observe!

                END
              sleep(5)
              msg = 'BATTLE IN PROGRESS! BATTLE IN PROGRESS!'

              10.times do
                print "\r#{ msg }"
                sleep 0.5
                print "\r#{ ' ' * msg.size }" # Flashes what is taking place.
                sleep 0.5
              end
                siege_towers = rand(1..8_500) # Attempts to bring down walls with different
                # chance percentage - attack value is near median between artillery & sappers
                wall_damage_siege = $theodosian_walls - siege_towers - ($luck_factor * siege_towers)
                  if wall_damage_siege > 7_500
                    sleep(3)
                    puts <<-END

    Praise God, Sultan! Our men are over the walls!

    As I predicted, hey did not have enough to bring down many of our towers
    and their defenders have been displaced near the gates where they where
    strongest!

    We have taken the city! The remnants of their army are fleeing
    through the tunnels.

    Janissaries are attempting to storm the Imperial Palace, and
    we should eliminate all further resistance in a day or two.

    Then, we can let the customary three-day looting begin!

    Congratulations, Memet II, Conqueror of The Roman Empire!

    GAME OVER. YOU WIN!

                    END
                  else
                    sleep(3)
                    puts <<-END

    DISASTER!

    Our assault has been has been repelled! How could this be?

    Curse the Romans! We should order all surviving troops to
    regroup and withdraw to safety in the north. We still have sizeable
    formations there to dissuade Constantine from ordering a counterattack.

    The Bulgars will welcome us. There is no love lost between them and
    the Romans.

    We will bring down this city once and for all, but perhaps
    now is not yet the time.

    GAME OVER. YOU LOSE!

                    END
                  end
              end
          else
            sleep(3)
            puts <<-END

    Ah! He is wise, that Constantine, much like his ancestors.

    He must have sent us the entire contents of his treasury.
    What will he have now to rebuild?!

    In the meantime, we will use that gold to expand our fleet and block off
    the city's access to the sea. Give them their relief for ten years
    and we will come back.

    Put out the word to lift the siege and break camp at once!

    God be praised that no one must perish today.

    And send my brother, the Emperor Constantine, a nice gift of thanks.

    GAME OVER. YOU WIN!

            END
          end
      when 'a' # Ottoman will order an assault
        sleep(3)
        puts <<-END

    God be praised! Our troops have been waiting for this day for so long!
    We have come so far and very soon, the greatest city in the world
    shall be ours!

    We go at once!

    Signal all commands to make ready their assault according to plan!

        END
        def ottoman_attack # Battle engine
          $western_reinforcements = rand(50_000..75_000)
          if $western_reinforcements > 60_000
            sleep(3)
            puts <<-END

    Sire! Scouts bring word that reinforcements from Europe have just landed.
    They are bolstering city defenses as we speak!

            END
          else
            sleep(3)
            puts <<-END
    It seems as if reinforcements from the West have arrived, but reports
    indicate their numbers are not what Constantine had been promised. Ha!

            END
          end
            ottoman_army_attack = rand((150_000)..($ottoman_army)) - ($eastern_roman_army + $western_reinforcements)
            # Calculates battle results with randomizer for strengths of opposing armies due to
            # reinforcements and casualties, etc., and based on theory of 3 attackers vs. 1 defender
            sleep(5)
            msg = 'BATTLE IN PROGRESS! BATTLE IN PROGRESS!'

            15.times do
              print "\r#{ msg }"
              sleep 0.5
              print "\r#{ ' ' * msg.size }" # Flashes what is taking place.
              sleep 0.5
            end
            if ottoman_army_attack > rand(90_000..100_000)
              sleep(3)
              puts <<-END

    Praise God, Sultan! We have taken the city! The remnants of their
    army are fleeing through their tunnels.

    Janissaries are attempting to storm the Imperial Palace, and
    we should eliminate all further resistance in a day or two.

    Then, we can let the customary three-day looting begin!

    Congratulations, Memet II, Conqueror of The Roman Empire!

    GAME OVER. YOU WIN!

              END
            else
              sleep(3)
              puts <<-END

    DISASTER!

    Our assault has been has been repelled! It must surely be those
    reinforcements.

    Curse the Romans! We should order all surviving troops to regroup
    and withdraw to safety in the west. We still have sizeable formations
    there to dissuade Constantine from ordering a counterattack.

    We will bring down this city once and for all, but perhaps
    now is not yet the time.

    GAME OVER. YOU LOSE!

              END
            end
        end
        sleep(5)
      ottoman_attack() # Calls on battle engine
      else # Ottoman default
        sleep(3)
        puts <<-END

    Sire, I do not understand your command. There is not a moment to lose.
    We have the greatest prize in the world right before us.

    GAME OVER. YOU LOSE!

        END
      end
    else # Player default
      sleep(3)
      puts <<-END

    Invalid choice. Again, please.

      END
      game_play # Loops to beginning of game
    end
  end
end
