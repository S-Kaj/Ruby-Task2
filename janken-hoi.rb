# じゃんけんのプログラムを定義する
def janken()
    janken_result = 0
    puts "じゃんけん......(半角数字で選んでください)"
    puts "1(グー), 2(チョキ), 3(パー), 0(戦わない)"

    while janken_result == 0 do # 初回またはあいこの時にじゃんけんを続ける
        your_move = rand(1..3)  # 相手のじゃんけんの手を数字で確定
        my_move = gets.to_i     # 自分のじゃんけんの手を数字で確定

        case your_move  # 相手の手を文字表記に置き換える
        when 1 then
            display_your_move = "グー"
        when 2 then
            display_your_move = "チョキ"
        when 3 then
            display_your_move = "パー"
        end

        case my_move    # 自分の手を文字表記に置き換える
        when 1 then
            display_my_move = "グー"
        when 2 then
            display_my_move = "チョキ"
        when 3 then
            display_my_move = "パー"
        end

        puts "----------"

        if my_move == 0 then    # 戦わない時
            puts "戦いを終了します。"
            break
        else                    # 戦う時
            puts "ポン！"
            puts "相手：#{display_your_move}"
            puts "自分：#{display_my_move}"

            janken_result = your_move - my_move # じゃんけんの結果を janken_result に入れる

            case janken_result
            when -2, 1  # じゃんけんに勝った時
                puts "じゃんけんに勝ちました！"
                puts "あっち向いて〜〜(半角数字で選んでください)"
                puts "1(上↑), 2(下↓), 3(左←), 4(右→), 0(戦わない)"

                hoi()

                if @hoi_result == 0 then        # あっち向いてホイに勝った時
                    puts "ホイ！"
                    puts "相手：#{@display_your_direction}"
                    puts "自分：#{@display_my_direction}"
                    puts "おめでとう！あなたの勝ちです！"
                elsif @my_direction == 0 then   # 戦わない時
                    puts "戦いを終了します。"
                else                            # それ以外
                    puts "ホイ！"
                    puts "相手：#{@display_your_direction}"
                    puts "自分：#{@display_my_direction}"
                    puts "じゃんけんに戻ります。"
                    janken()
                end 

            when -1, 2  # じゃんけんに負けた時
                puts "じゃんけんに負けました...。" 
                puts "あっち向いて〜〜(半角数字で選んでください)"
                puts "1(上↑), 2(下↓), 3(左←), 4(右→), 0(戦わない)"

                hoi()

                if @hoi_result == 0 then        # あっち向いてホイに負けた時
                    puts "ホイ！"
                    puts "相手：#{@display_your_direction}"
                    puts "自分：#{@display_my_direction}"
                    puts "残念！あなたの負けです。"
                elsif @my_direction == 0        # 戦わない時
                    puts "戦いを終了します。"
                else                            # それ以外
                    puts "ホイ！"
                    puts "相手：#{@display_your_direction}"
                    puts "自分：#{@display_my_direction}"
                    puts "じゃんけんに戻ります。"
                    janken()
                end 

            when 0      # あいこの時
                puts "あいこで......(半角数字で選んでください)"
                puts "1(グー), 2(チョキ), 3(パー), 0(戦わない)"
            end

        end

    end

end

# あっち向いてホイを定義する
def hoi()
    @your_direction = rand(1..4) # 相手の向きを数字で確定
    @my_direction = gets.to_i    # 自分の向きを数字で確定
    @hoi_result = @your_direction - @my_direction

    case @your_direction # 相手の向きを文字表記に置き換える
    when 1 then
        @display_your_direction = "上(↑)"
    when 2 then
        @display_your_direction = "下(↓)"
    when 3 then
        @display_your_direction = "左(←)"
    when 4 then
        @display_your_direction = "右(→)"
    end

    case @my_direction # 自分の向きを文字表記に置き換える
    when 1 then
        @display_my_direction = "上(↑)"
    when 2 then
        @display_my_direction = "下(↓)"
    when 3 then
        @display_my_direction = "左(←)"
    when 4 then
        @display_my_direction = "右(→)"
    end

    puts "----------"

end

# 定義したじゃんけんを呼び出す
janken()