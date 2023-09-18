--The card type “Platinum” was used for which “Exp Type” the most?

select "card type","exp type", max(count1) 
from(select "card type", count("card type") as count1, "exp type"from credit_cards where 
"card type"="Platinum" group by "exp type");