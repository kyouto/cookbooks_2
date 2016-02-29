# LWRPの呼び出し
user_account 'yujiro' do            # tsuchikazuというユーザを
  action :create                        # 作成するよ
  ssh_keys  ['ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5EVt4z++gSaAd1CQa7HcrqALr0pXushjY7QPj9TnETwwC6aEXYvKgSHafbw/yEIWtRH6citErz/x7sRLYy3AgINmwG/PHHXe10Jgvu61LhQHn9Vx5v2Z0JFnTugQDYS+kZeY7HeoyGiMAJHVL7s6/xAA42DSUc++KuVHEMN1oS2TmHgMV+6BM6F+OlLEoN6HpQcH9MmxP/KWEiT+AJ0+veNft5AcTiQORUE+9Su0r+CsYL/FKfoN9WklUl4AltH64RGI7a56hEpQG84YgO86yJScK0GNtZDVvOcIikak5kp4unloZXfx0OLhQNZ1tl3jiuYPKf9XESCUyn530/wmP yujiro@yujiro-no-MacBook-Air.local']  # authorized_keysはこれで
end

