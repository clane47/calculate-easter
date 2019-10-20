
import Foundation

let df = DateFormatter()
df.dateFormat = "MM/dd/yyyy"

func whenIsEaster(_ year: Int) -> String {
    var c,n,k,i,j,l,month,day: Int
    c = year/100
    n = year-19*(year/19)
    k = (c-17)/25
    i = c-c/4-(c-k)/3+19*n+15
    i = i-30*(i/30)
    i = i-(i/28)*(1-(i/28))*(29/(i+1))*((21-n)/11)
    j = year+year/4+i+2-c+c/4
    j = j-7*(j/7)
    l = i-j
    month = 3+(l+40)/44
    day = l+28-31*(month/4)
    
    let dateString = String(month) + "/" + String(day) + "/" + String(year)
    let easterDate = df.date(from: dateString)!
    df.dateStyle = .medium
    let finalDate = df.string(from: easterDate)
    
    return (finalDate)
}

let easter = whenIsEaster(2019)
print(easter)

